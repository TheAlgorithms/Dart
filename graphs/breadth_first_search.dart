import 'dart:collection';
import 'package:test/test.dart';

/// Implementation of Breadth First Search
/// https://en.wikipedia.org/wiki/Breadth-first_search

class Graph {
  /// Adjacency List representation using dynamic list and HashMap
  HashMap graph = new HashMap<int, List<dynamic>>();
  List<int> nodes;

  void makeGraph() {
    /// initialise all nodes with empty lists.
    /// each node will have a list as value which stores
    /// the nodes to which it is connected to
    for (int i = 0; i < this.nodes.length; i++) {
      this.graph[nodes[i]] = [];
    }
  }

  Graph(this.nodes) {
    this.makeGraph();
  }

  int get numberOfNodesInGraph {
    return this.nodes.length;
  }

  HashMap get graphDataStructure {
    return this.graph;
  }

  void addNodes(int newNode) {
    this.nodes.add(newNode);
    this.graph[newNode] = [];
  }

  void addEdges(int start, int end) {
    this.graph[start].add(end);
  }
}

List<int> breadthFirstSearch(Graph graph, int numberOfNodes, int startNode) {
  Queue queue = new Queue<int>();
  List<int> answer = [];
  queue.add(startNode);
  while (queue.isNotEmpty) {
    int node = queue.removeFirst();
    answer.add(node);
    for (int child in graph.graph[node]) {
      queue.add(child);
    }
  }
  return answer;
}

void main() {
  test(('Test case 1:'), () {
    List<int> nodes = [0, 1, 2];
    int numberOfEdges = 2;

    List<List<int>> edges = [
      [0, 1],
      [0, 2]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        breadthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2]));
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
        breadthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 3, 4]));
  });
}
