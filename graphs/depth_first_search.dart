import 'dart:collection';
import 'package:test/test.dart';

/// Implementation of Depth First Search
/// https://en.wikipedia.org/wiki/Depth-first_search

class Graph {
  /// Adjacency List representation using dynamic list and HashMap
  HashMap graph = new HashMap<int, List<dynamic>>();
  int numberOfNodes;

  void makeGraph() {
    /// initialise all nodes with empty lists.
    /// each node will have a list as value which stores
    /// the nodes to which it is connected to
    for (int i = 0; i < this.numberOfNodes; i++) {
      this.graph[i] = List();
    }
  }

  Graph(this.numberOfNodes);

  int get numberOfNodesInGraph {
    return this.numberOfNodes;
  }

  HashMap get graphDataStructure {
    return this.graph;
  }

  void addEdges(int start, int end) {
    this.graph[start].add(end);
  }
}

void depthFirstSearchHelper(graph, visitedNodes, node, answer) {
  if (visitedNodes[node]) {
    return null;
  }
  visitedNodes[node] = true;
  answer.add(node);
  if (graph.containsKey(node)) {
    for (int child in graph[node]) {
      if (!visitedNodes[child]) {
        depthFirstSearchHelper(graph, visitedNodes, child, answer);
      }
    }
  }
}

List<int> depthFirstSearch(Graph graph, int numberOfNodes, int startNode) {
  List<bool> visitedNodes =
      new List<bool>.generate(numberOfNodes, (index) => false);

  List<int> answer = List();
  depthFirstSearchHelper(graph.graph, visitedNodes, startNode, answer);
  return answer;
}

void main() {
  test(('Test case 1:'), () {
    int numberOfNodes = 4;
    int numberOfEdges = 3;

    List<List<int>> edges = [
      [0, 1],
      [1, 2],
      [0, 3]
    ];
    Graph graph = Graph(numberOfNodes);
    graph.makeGraph();

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer = depthFirstSearch(graph, numberOfNodes, startNode);
    expect(answer, equals([0, 1, 2, 3]));
  });

  test(('Test case 2:'), () {
    int numberOfNodes = 5;
    int numberOfEdges = 4;

    List<List<int>> edges = [
      [0, 1],
      [0, 2],
      [0, 3],
      [2, 4]
    ];
    Graph graph = Graph(numberOfNodes);

    graph.makeGraph();

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer = depthFirstSearch(graph, numberOfNodes, startNode);
    expect(answer, equals([0, 1, 2, 4, 3]));
  });
}
