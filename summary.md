# Strong And Weak Ties

A **Bridge** is an edge connecting $$u$$ and $$v$$ whose removal would cause $$u$$ and $$v$$ to lie in two different connected components.

An edge joining two nodes $$u$$ and $$v$$ in a graph is a **Local Bridge** if its endpoints $$u$$ and $$v$$ have no friends in common. The **Span of a Local Bridge** is the distance its endpoints would be from each other if the edge was deleted.

**Strong Ties** and **Weak Ties** are special edges. If two nodes have a common neighbor connected by strong ties they must at least be connected by a weak tie themselves. This is called the **Triadic Closure Property**.

The **Betweenness** of an edge is the number of shortest paths in which it is contained.


# Degree Distribution

**Pareto Principle**: 20% of people create 80% of all dank memes.

A **Random Graph** has $$n$$ nodes and each possible edge exists with propability $$p$$.

The **Lorenz Curve** describes, for example, how wealth is distributed in the population. It represents statements like "80% of all rare pepes belong to the top 20% dankest people". The **Gini Coefficient** describes the percentage of the area above the Lorenz Curve compared to the whole area below the diagonal (which represents equality).

![An example Lorenz Curve with Gini Coefficient $$G$$](img/lorenz-curve.png)

## Distributions:

* **Normal Distribution** $$f(x) = e^(-x^2/2)$$
* **Exponential Distribution** $$f(x) = x^constant$$
* **Power Law Distribution** $$f(x) = constant^x$$ Looks like a linear function on a log-log scale.

Many distributions IRL follow are power law distributions. For example, few languages are spoken by many people, but many languages are spoken by few people. One explanation for this is the **Rich Get Richer Model**, which states that power laws arise from the feedback introduced by correlated decisions since people tend to copy the decisions of people who acted before them (**Matthew Effect**). This causes an **Information Cascade**. For Marketing this means that there are two markets: One for "Hits" (few items that each sell a lot) and one for "niche products" (many items that each sell worse).


# Small Worlds Network

> A **Small-World Network** is a type of mathematical graph in which most nodes are not neighbors of one another, but most nodes can be reached from every other node by a small number of hops or steps.

In a social network most people have **Six Degrees Of Separation** between them, i.e. there are 6 other people between them and any other person, but most people only have a limited number of neighbors, thus social networks tend to be Small-World Networks.

**Global Clustering Coefficient**: Fraction of closed paths of length 2 (triangles) to number of paths of length 2. Low values indicate a tree-like network. **Local Clustering Coefficient**: Fraction of connected neighboring pairs of a node to number of neighboring pairs. The **Average Clustering Coefficient** averages the Local Clustering Coefficient. Small-World Networks have high Clustering Coefficients. A high number of **Triadic Closures** increases the Clustering Coefficient.

**The Erdős–Rényi Model**: Random Network where $$n$$ nodes have propability $$p$$ to be connected. Produces networks with small average distances and low clustering coefficients. **Lattices** are grid-like networks with long average distances and high Clustering Coefficients. The **Watts–Strogatz Model** adresses this problem by generating a netowk with high Clustering Coefficients and a power-law-like degree distribution. It works by creating a Ring Lattice and rewiring some of the edges ([detailed explanation on Wikipedia](https://en.wikipedia.org/wiki/Watts_and_Strogatz_model#Algorithm)).


# Centrality

* **Degree**: Number of Neighbors
* **Betweenness** (of an edge): Number of shortest paths in which it is contained.
* **Closeness**: Average distance to all other nodes.
* **Eccentricity**: Maximum distance to all other nodes. The **Diameter** of a graph is the maximum Eccentricity. The **Radius** of a graph is the minimum Eccentricity.
* **In-Degree** (directed graph):
* **Random Walk Centrality** (directed graph):
* **PageRank** (directed graph):
* **HITS** (directed graph):

## Eigenvector Centrality

Square matrices can be used to transform vectors. For every square matrix, there is a non-zero vector whose direction is not changed by the transformation. This is the **Eigenvector**, and the change in length is the **Eigenvalue** of the transformation matrix. Hence the formula $$Av = \lambda v$$ where $$A$$ is the matrix, $$v$$ the Eigenvector and $$\lambda$$ the Eigenvalue. For example:

$$
\[
 \begin{matrix}
  2 & 1 \\
  1 & 2
 \end{matrix}
\]
\[
 \begin{matrix}
  3 \\
  -3
 \end{matrix}
\]
=
1
\[
 \begin{matrix}
  3 \\
  -3
 \end{matrix}
\]
$$

# Link Prediction


# Game Theory


# Markets


# Signed Networks


# Clustering


# Auctions


# Cascading


# Network Effects
