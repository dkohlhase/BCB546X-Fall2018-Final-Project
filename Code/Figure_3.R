
# -------~~ DATASET 1: edgelist  --------

getwd()

setwd("./Data/additional_materials")
 
# Read in the data:
nodes <- read.csv("nodes_file.csv", header=T, as.is=T)
links <- read.csv("d_edges_file.csv", header=T, as.is=T)

# Examine the data:
head(nodes)
tail(nodes)
head(links)
tail(links)
# Converting the data to an igraph object:
# The graph_from_data_frame() function takes two data frames: 'd' and 'vertices'.
# 'd' describes the edges of the network - it should start with two columns 
# containing the source and target node IDs for each network tie.
# 'vertices' should start with a column of node IDs. It can be omitted.
# Any additional columns in either data frame are interpreted as attributes.

library("igraph")

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 


# Examine the resulting object:
class(net)
net 

# The description of an igraph object starts with four letters:
#     D or U, for a directed or undirected graph
#     N for a named graph (where nodes have a `name` attribute)
#     W for a weighted graph (where edges have a `weight` attribute)
#     B for a bipartite (two-mode) graph (where nodes have a `type` attribute)
# The two numbers that follow (17 49) refer to the number of nodes and edges in the graph.
# The description also lists node & edge attributes


# We can access the nodes, edges, and their attributes:
E(net)
V(net)
E(net)$type
V(net)$media

# If you need them, you can extract an edge list 
# or a matrix back from the igraph networks.
as_edgelist(net, names=T)
as_adjacency_matrix(net, attr="weight")

# Or data frames describing nodes and edges:
as_data_frame(net, what="edges")
as_data_frame(net, what="vertices")


# You can also access the network matrix directly:
net[1,]
net[5,7]

# First attempt to plot the graph:
plot(net) # not pretty!

# Removing loops from the graph:
net <- simplify(net, remove.multiple = F, remove.loops = T) 

# Let's and reduce the arrow size and remove the labels:
plot(net, edge.arrow.size=.4,vertex.label=NA)

# Plot with curved edges (edge.curved=.1) and reduce arrow size:
# Note that using curved edges will allow you to see multiple links
# between two nodes (e.g. links going in either direction, or multiplex links)
plot(net, edge.arrow.size=.4, edge.curved=.2)

# Set edge color to light gray, the node & border color to orange 
# Replace the vertex label with the node names stored in "media"
plot(net, edge.arrow.size=.2, edge.curved=.2, edge.color="grey",
     vertex.color="white", vertex.frame.color="#ffffff", vertex.label=V(net)$media,
     vertex.label.color="black", vertex.label.family="Arial",
     vertex.label.cex=.5, vertex.label.font=2) 


