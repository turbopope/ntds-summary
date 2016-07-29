# Strong And Weak Ties

A **Bridge** is an edge connecting $u$ and $v$ whose removal would cause $u$ and $v$ to lie in two different connected components.

An edge joining two nodes $u$ and $v$ in a graph is a **Local Bridge** if its endpoints $u$ and $v$ have no friends in common. The **Span of a Local Bridge** is the distance its endpoints would be from each other if the edge was deleted.

**Strong Ties** and **Weak Ties** are special edges. If two nodes have a common neighbor connected by strong ties they must at least be connected by a weak tie themselves. This is called the **Triadic Closure Property**.

The **Betweenness** of an edge is the number of shortest paths in which it is contained.


# Degree Distribution

**Pareto Principle**: 20% of people create 80% of all dank memes.

A **Random Graph** has $n$ nodes and each possible edge exists with propability $p$.

The **Lorenz Curve** describes, for example, how wealth is distributed in the population. It represents statements like "80% of all rare pepes belong to the top 20% dankest people". The **Gini Coefficient** describes the percentage of the area above the Lorenz Curve compared to the whole area below the diagonal (which represents equality).

![An example Lorenz Curve with Gini Coefficient $G$](img/lorenz-curve.png)

## Distributions:

* **Normal Distribution** $f(x) = e^{(-x^2/2)}$
* **Exponential Distribution** $f(x) = x^constant$
* **Power Law Distribution** $f(x) = constant^x$ Looks like a linear function on a log-log scale.

Many distributions IRL follow are power law distributions. For example, few languages are spoken by many people, but many languages are spoken by few people. One explanation for this is the **Rich Get Richer Model**, which states that power laws arise from the feedback introduced by correlated decisions since people tend to copy the decisions of people who acted before them (**Matthew Effect**). This causes an **Information Cascade**. For Marketing this means that there are two markets: One for "Hits" (few items that each sell a lot) and one for "niche products" (many items that each sell worse).


# Small Worlds Network

> A **Small-World Network** is a type of mathematical graph in which most nodes are not neighbors of one another, but most nodes can be reached from every other node by a small number of hops or steps.

In a social network most people have **Six Degrees Of Separation** between them, i.e. there are 6 other people between them and any other person, but most people only have a limited number of neighbors, thus social networks tend to be Small-World Networks.

**Global Clustering Coefficient**: Fraction of closed paths of length 2 (triangles) to number of paths of length 2. Low values indicate a tree-like network. **Local Clustering Coefficient**: Fraction of connected neighboring pairs of a node to number of neighboring pairs. The **Average Clustering Coefficient** averages the Local Clustering Coefficient. Small-World Networks have high Clustering Coefficients. A high number of **Triadic Closures** increases the Clustering Coefficient.

**The Erdős–Rényi Model**: Random Network where $n$ nodes have propability $p$ to be connected. Produces networks with small average distances and low clustering coefficients. **Lattices** are grid-like networks with long average distances and high Clustering Coefficients. The **Watts–Strogatz Model** adresses this problem by generating a netowk with high Clustering Coefficients and a power-law-like degree distribution. It works by creating a Ring Lattice and rewiring some of the edges ([detailed explanation on Wikipedia](https://en.wikipedia.org/wiki/Watts_and_Strogatz_model#Algorithm)).


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

Square matrices can be used to transform vectors. For every square matrix, there is a non-zero vector whose direction is not changed by the transformation. This is the **Eigenvector**, and the change in length is the **Eigenvalue** of the transformation matrix. Hence the formula $Av = \lambda v$ where $A$ is the matrix, $v$ the Eigenvector and $\lambda$ the Eigenvalue. For example:

$$
\left[\begin{matrix}
  2 & 1 \\
  1 & 2
\end{matrix}\right]
\left[\begin{matrix}
  3 \\
  -3
\end{matrix}\right]
=
1
\left[\begin{matrix}
  3 \\
  -3
\end{matrix}\right]
$$

![Some Graph](img/cgraph.jpg)

The graph above has the adjacency matrix:

~~~octave
A = [
  [0, 1, 1, 0, 0],
  [1, 0, 1, 0, 1],
  [1, 1, 0, 1, 1],
  [0, 0, 1, 0, 1],
  [0, 1, 1, 1, 0]
]
~~~

Through some Octave Magic `[V, eigs] = eig(A)` we know A's Eigenvectors:

~~~
V =
  -3.7175e-01  -4.2937e-01  -4.3904e-01   6.0150e-01  -3.5054e-01
   6.0150e-01  -1.3784e-01   5.1004e-01   3.7175e-01  -4.6996e-01
  -9.4865e-16   7.7024e-01  -3.0694e-01  -1.3791e-16  -5.5903e-01
   3.7175e-01  -4.2937e-01  -4.3904e-01  -6.0150e-01  -3.5054e-01
  -6.0150e-01  -1.3784e-01   5.1004e-01  -3.7175e-01  -4.6996e-01
~~~

Somehow we recognize the 5th column of $V$ as the Eigenvector Centrality Vector (maybe it's because it is the only column that does not contain mixed signs?). Anyway, each element in that column tells us the "Centrality" of the corresponding node (in the example the node $2$ obviously has the highest Centrality).

This can also be calculated manually through the power-iteration:

~~~octave
power_v = ones(rows(A), 1);
e = 0.000001;
l = 0;

do
  power_v = A*power_v;
  l_prev = l;
  l = norm(power_v);
  power_v = power_v/l;
until (abs(l_prev - l) < e)
~~~

For the example above, this produces

~~~
power_v =
   0.35061
   0.46998
   0.55890
   0.35061
   0.46998
~~~

which is close enough.

# Link Prediction

... in social networks gives friends-recommendations and the likes. If $A$ is an adjacency matrix, $A^2$ contains the number of common friends of two nodes (and the number of neighbors on the diagonal).

![Ignore the stump on node 4 and the 1-indexing](img/lpgraph.png)

For the graph above, this means:

$$
A^2=
\left(\begin{matrix}
  0 & 1 & 0 & 0 \\
  1 & 0 & 1 & 1 \\
  0 & 1 & 0 & 1 \\
  0 & 1 & 1 & 0
\end{matrix}\right)^2
=
\left(\begin{matrix}
  1 & 0 & 1 & 1 \\
  0 & 3 & 1 & 1 \\
  1 & 1 & 2 & 1 \\
  1 & 1 & 1 & 2
\end{matrix}\right)
$$

For example, based an this, a friendship between $1$ and $3$ would be suggested, because $A^2_{1,3} \geq 1$.

Generally, $A^n$ contains the number of paths with length $n$ between two nodes:

$$
A^3=
\left(\begin{matrix}
  0 & 3 & 1 & 1 \\
  3 & 2 & 4 & 4 \\
  1 & 4 & 2 & 3 \\
  1 & 4 & 3 & 2
\end{matrix}\right)
$$

For example the 3 (=$A^3_{1, 2}$) paths of length 3 between $1$ and $2$ are $\{1\rightarrow2\rightarrow1\rightarrow2, 1\rightarrow2\rightarrow3\rightarrow2, 1\rightarrow2\rightarrow4\rightarrow3\}$.


# Game Theory

Examines situations where the outcome for one person depends both on their and other people's choices. A **Game** has a set of **Players**. (Stepwise,) Players simultaniously choose **Strategies** and receive **Payoffs**. A Game is completely defined by a **Payoff matrix**, for example the Payoff Matrix of the stupid Ultimatum Game from the slides is:

| Player1/Player2 | Accept | Reject |
| --------------- | ------ | ------ |
| Give 0          | (5,0)  | (0,0)  |
| Give 1          | (4,1)  | (0,0)  |
| Give 2          | (3,2)  | (0,0)  |
| Give 3          | (2,3)  | (0,0)  |
| Give 4          | (1,4)  | (0,0)  |
| Give 5          | (0,5)  | (0,0)  |

```
The slides say that *Give 1/Accept* is "the best strategy"
but I don't see why, since all payoffs in the *Accept*-column
sum up to 5 and also why is a strategy suddenly a pair of
"choices" and not just a "choice"?
– Marcő
```

That's because the example is bad, it's not actually a simultaneous choice. Player 1 chooses an amount and Player 2 decides *afterwards* if they want to accept or reject. Example broken.

However, you can still reason about this. All players are omniscient, even about each other. They also behave “rationally”, i.e. their prime directive is to optimize their own gain and their secondary objective is to minimize their opponent's gain (unless it's a collaborative game, but whatever).

If Player 1 gives 0, Player 2 can't optimize their own gain, so they will fall back to minimizing their opponent's game, leading to a rejection. If Player 1 gives them any other amount, they will accept, because rejecting would compromise the prime directive.

Because of their omniscience, Player 1 *knows* that Player 2 will respond like this, so giving 1 is obviously the best option. This is also why it's a pair of choice, Player 1 already knows what Player 2 will choose and bases their strategy on that.

If Player2 chooses a strategy $T$, $S$ is the **(strict) best response** if it's payoff is better (strictly better) than every other response:

$$
\forall_{S'\setminus\{S\}}: P_1(S, T) \geq P_1(S', T)
$$

$P_1$ denotes the payoff for Player 1. A **Dominant Strategy** for Player 1 is a best response to every strategy of Player 2:

$$
\forall_{S'\setminus\{S\}, T}: P_1(S, T) \geq P_1(S', T)
$$

A **Nash Equilibrium** is a pair of strategies that are best responses to each other. There can be multiple Nash Equilibria in one game. For example, when two people chose between two incompatible software alternatives, chosing the same alternative are Nash Equilibria.

| A/B        | MSOffice | OpenOffice |
| ---------- | -------- | ---------- |
| MSOffice   | (1, 1)   | (0, 0)     |
| OpenOffice | (0, 0)   | (1, 1)     |

An outcome of a game is **Pareto Optimal** if there is no way to increase the total payoff without reducing the payoff of an individual. A pair of strategies is **dominated** by another pair if the above is true. $(S,T)$ is dominated by $(S',T')$ if:

$$
P_1(S') > P_1(S) \land P_2(T') \geq P_2(T) \lor P_1(S') \geq P_1(S) \land P_2(T') > P_2(T)
$$

If a player only plays one strategy, he is playing a **Pure Strategy**. If he chooses the strategy at random, he is playing a **Mixed Strategy**. If all players play a Pure Strategy and a Nash Equlibrium, this is called **Pure Strategy Nash Equilibrium**.


## Example

In exercise 7, we have this here payoff matrix:

|            | Player1: A | Player1: B | Player1: C |
| ---------- | ---------- | ---------- | ---------- |
| Player2: A | (4, 2)     | (5, 1)     | (3, 0)     |
| Player2: B | (3, 2)     | (4, 4)     | (1, 0)     |
| Player2: C | (2, 3)     | (4, 2)     | (3, 2)     |

First off, we'll need the best responses for both players. For that I have developed a response matrix notation, patent pending.

| Player 2 picks | Best responses for Player 1 |
| -------------- | --------------------------- |
| A              | B                           |
| B              | B                           |
| C              | B                           |

| Player 1 picks | Best responses for Player 2 |
| -------------- | --------------------------- |
| A              | C                           |
| B              | B                           |
| C              | C                           |

In this case, all best responses also happen to be strictly best responses. It should also be obvious that Player 1 has a dominant strategy of just B every round.

It's also clear from these that B/B is a Nash Equilibrium, because they are best responses for each other.

For the Pareto Optimum, we'll just walk through the matrix and look at every value and look for another value that would improve upon it without reducing any one player's payoff:

1. (4, 2): not optimal, (4, 4) is better
2. (5, 1): **optimal**
3. (3, 0): not optimal, (5, 1) is better
4. (3, 2): not optimal, (4, 2) is better
5. (4, 4): **optimal**
6. (1, 0): not optimal, (3, 0) is better
7. (2, 3): not optimal, (4, 4) is better
8. (4, 2): see 1.
9. (3, 2): see 4.

# Markets


# Signed Networks


# Clustering

## Local Clustering Coefficient

Take this graph here:

![This graph here](img/cc0.png)

We'll look at the clustering coefficient of Node 4, which we'll now call $u_4$.

First off, figure out which nodes are neighbors of $u_4$.

![Neighbors to $u_4$](img/cc1.png)

It's connected to $u_2$, $u_3$, $u_5$ and $u_6$. That means its degree $d(u_4) = 4$.

Then count the number of connections between the neighbors of $u_4$:

![Connections between neighbors of $u_4$](img/cc2.png)

It doesn't seem like the lecture gives any name to this, so I'll just call it $p(u_4) = 2$, because it's **p**airs.

Now we can calculate the local clustering coefficient via the formula $cc(u) = \frac{2 p(u)}{d(u) (d(u) - 1)}$:

$$
cc(u_4) = \frac{2 p(u_4)}{d(u_4) (d(u_4) - 1)} = \frac{2 \cdot 2}{4 \cdot (4 - 1)} = \frac{4}{12} = \frac{1}{3}
$$

The result will always be $0 \leq cc(u) \leq 1$. The extreme values are shown here:

![Extreme Clusters, Star and Clique](img/ccx.png)

## Global Clustering Coefficient

Calculate the local clustering coefficient for all $u \in G$. Then average them.


# Auctions


# Cascading


# Network Effects
