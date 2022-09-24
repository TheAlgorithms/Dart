import 'dart:collection';
import 'package:test/test.dart';

/// Implementation of Depth First Search
/// https://en.wikipedia.org/wiki/Depth-first_search

class Graph {
  /// Adjacency List representation using dynamic list and HashMap
  HashMap graph = HashMap<int, List<dynamic>>();
  List<int> nodes;

  void makeGraph() {
    /// initialise all nodes with empty lists.
    /// each node will have a list as value which stores
    /// the nodes to which it is connected to
    for (int i = 0; i < nodes.length; i++) {
      graph[nodes[i]] = [];
    }
  }

  Graph(this.nodes) {
    makeGraph();
  }

  int get numberOfNodesInGraph {
    return nodes.length;
  }

  HashMap get graphDataStructure {
    return graph;
  }

  void addNodes(int newNode) {
    nodes.add(newNode);
    graph[newNode] = [];
  }

  void addEdges(int start, int end) {
    graph[start].add(end);
  }
}

void depthFirstSearchHelper(graph, visitedNodes, node, answer) {
  if (visitedNodes[node]) {
    return;
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
      List<bool>.generate(numberOfNodes, (index) => false);

  List<int> answer = [];
  depthFirstSearchHelper(graph.graph, visitedNodes, startNode, answer);
  return answer;
}

void main() {
  test(('Test case 1:'), () {
    List<int> nodes = [0, 1, 2, 3];
    int numberOfEdges = 3;

    List<List<int>> edges = [
      [0, 1],
      [1, 2],
      [0, 3]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        depthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 3]));
  });

  test(('Test case 2:'), () {
    List<int> nodes = [0, 1, 2, 3, 4];
    int numberOfEdges = 4;

    List<List<int>> edges = [
      [0, 1],
      [0, 2],
      [0, 3],
      [2, 4]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        depthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 4, 3]));
  });
}
