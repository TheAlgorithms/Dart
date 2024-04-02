import 'dart:math';

/// Graph represented as adjacency matrix
/// [nodes] - node names preserved in order
/// [adjacencyMatrix] edge weights, distances between nodes
class Graph {
  List<String> nodes;
  List<List<double>> adjacencyMatrix;

  Graph(this.nodes, this.adjacencyMatrix);
}

/// Find path visiting all nodes in given [graph] using greedy approach
List<String> nearestNeighbourSearch(Graph graph) {
  List<String> path = [];
  Set<int> unvisitedNodes = Set.from(Iterable.generate(graph.nodes.length));

  int currentNode = 0;
  while (unvisitedNodes.isNotEmpty) {
    unvisitedNodes.remove(currentNode);
    int? nearestNeighbour;
    double nearestNeighbourDistance = 0;

    for (int neighbour in unvisitedNodes) {
      double neighbourDistance = graph.adjacencyMatrix[currentNode][neighbour];
      if (nearestNeighbour == null ||
          neighbourDistance < nearestNeighbourDistance) {
        nearestNeighbour = neighbour;
        nearestNeighbourDistance = neighbourDistance;
      }
    }

    path.add(graph.nodes[currentNode]);
    currentNode = nearestNeighbour ?? 0;
  }

  return path;
}

class Point {
  double x;
  double y;

  @override
  String toString() => "P($x, $y)";

  Point(this.x, this.y);
}

/// Euclidean distance between [p1] and [p2]
double distance(Point p1, Point p2) {
  return sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));
}

/// Form graph using given [points].
/// Edge weights will correspond to distances
Graph fromPoints(List<Point> points) {
  List<String> nodes = [];
  List<List<double>> adjacencyMatrix = [];

  for (Point p1 in points) {
    List<double> neigbourDistances = [];
    for (Point p2 in points) {
      neigbourDistances.add(distance(p1, p2));
    }
    nodes.add(p1.toString());
    adjacencyMatrix.add(neigbourDistances);
  }

  return Graph(nodes, adjacencyMatrix);
}

void main() {
  Graph graph = Graph([
    "A",
    "B",
    "C",
    "D",
    "E"
  ], [
    [0, 12, 4, 54, 100],
    [3, 0, 5, 1, 1],
    [300, 20, 0, 433, 123],
    [32, 31, 54, 0, 3],
    [2, 65, 12, 32, 0]
  ]);

  print(nearestNeighbourSearch(graph));

  List<Point> points = [
    new Point(0, 0),
    new Point(0, 10),
    new Point(-10, 10),
    new Point(3.33, 8.11),
    new Point(12, 11),
    new Point(-1, 1),
    new Point(-2, 2)
  ];

  print(nearestNeighbourSearch(fromPoints(points)));
}
