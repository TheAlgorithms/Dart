/// Author: Kyle
/// Email: kwfergus117@gmail.com

// Returning false, will short-circuit the search algorithm.
// Returning true, will allow the search algorithm to continue.
typedef bool NodeHandler(Node node);

/// Used to represent a node in a graph whose value is of type [T].
class Node<T> {
  Node(this.value, {edges}) : edges = edges ?? <Node<T>>[];

  /// The [value] the [Node] should store.
  T value;
  /// The directional edges it has to other nodes.
  List<Node<T>> edges;

  void remove(Node<T> rmEdge) {
    edges.removeWhere((edge) => edge == rmEdge);
  }

  @override
  String toString() {
    return '{ value: ${value}, edges: [${edges.map((n) => n.value).join(',')}], hashCode: $hashCode }';
  }

  @override
  bool operator ==(Object other) {
    return other is Node<T> &&
        other.value == value &&
        other.edges.length == edges.length &&
        edges.every((edge) => other.edges.contains(edge));
  }

  @override
  int get hashCode => value.hashCode^edges.hashCode;
}

/// Can store a set of nodes that represent disjointed graphs as a single graph.
class Graph<T> {

  /// Initialize graph with set of nodes from a [flattenedGraph].
  Graph.fromNodes(List<Node<T>> flattenedGraph) {
    _nodes = _mapFlattenedGraph(flattenedGraph);
  }

  /// Builds a graph from the provided [node].
  Graph.build(Node<T> node, {initWithDfs =true}) {
    _nodes = _mapFlattenedGraph(flattenGraph(node, useDfs: initWithDfs));
  }

  /// Map of all nodes in the graph keyed with the value of the node.
  Map<T,Node<T>> _nodes = {};

  @override
  String toString() {
    final buffer = StringBuffer();
    _nodes.values.forEach(buffer.writeln);
    return buffer.toString();
  }

  /// takes a graph that's flattened to a list of all it's [nodes] and maps
  /// the value of each node to that respective node. For faster reading.
  Map<T, Node<T>> _mapFlattenedGraph(List<Node<T>> nodes, {bool reset = false}) {
    final flatGraph = <T, Node<T>>{};
    nodes.forEach((node) => flatGraph[node.value] = node);
    return flatGraph;
  }

  /// Removes the node that stores [value] from the graph.
  Node<T> remove(T value) {
    print('node count: ${_nodes.length}');
    final rmNode = _nodes.remove(value);
    print('found rmNode: ${rmNode}');
    print('node count: ${_nodes.length}');
    _nodes.values.forEach((node) => node.remove(rmNode));
    return rmNode;
  }

  /// Returns the node in the graph that stores [value].
  /// Returns [null] if there is no node mapped to [value].
  Node<T> getNode(T value) => _nodes[value];

  /// Builds a new node that stores [value] and can optionally sets that node's
  /// [edges]
  void addValue(T value, {List<Node<T>> edges = const []}) {
    final newNode = Node<T>(value, edges: edges);
    _nodes[value] = newNode;
  }

  /// Adds the [node] to the graph. Also traverses the node. If it has an edge
  /// to any node(s) that are not already in the current graph, then they too are
  /// added to the graph. If [useDfs] is true, which it defaults to,
  //   /// then the traversal will leverage Depth First Search; otherwise it will
  //   /// use Breadth First Search.
  void addNode(Node<T> node, {useDfs = true}) {
    final discoveredNodes = <Node<T>>[];
    final handler = (Node node) {
      if (!_nodes.containsKey(node.value)) discoveredNodes.add(node);
      return true;
    };
    useDfs ? dfs<T>(node, handler) : bfs<T>(node, handler);
    discoveredNodes.forEach((newNode) => _nodes[newNode.value] = newNode);
  }

  ////----------//// STATIC METHODS ////----------////

  /// Removes all edges connecting to the node that stores [value] given a starting
  /// [node] to traverse. If [useDfs] is true, which it defaults to,
  //   /// then the traversal will leverage Depth First Search; otherwise it will
  //   /// use Breadth First Search.
  static void removeFromGraph<E>(E value, Node<E> node, {bool useDfs = true}) {
    final rmNode = find<E>(value, node, useDfs: useDfs);
    var handler = (node) {
      node.edges.remove(rmNode);
      return true;
    };
    useDfs ? dfs<E>(node, handler) : bfs<E>(node, handler);
  }


  /// Traverses the entire graph given a [node] and returns a list of all nodes
  /// found during traversal. If [useDfs] is true, which it defaults to,
  /// then the traversal will leverage Depth First Search; otherwise it will
  /// use Breadth First Search.
  static List<Node<E>> flattenGraph<E>(Node<E> node, {bool useDfs = true}) {
    final flattenList = <Node<E>>[];
    var handler = (node) {
      flattenList.add(node);
      return true;
    };
    useDfs ? dfs<E>(node, handler) : bfs<E>(node, handler);
    return flattenList;
  }

  /// Finds a node that stores [value] in a Graph given a [node]. If [useDfs]
  /// is true, which it defaults to, then the traversal will leverage
  /// Depth First Search; otherwise it will use Breadth First Search.
  static Node<E> find<E>(E value, Node<E> node, {bool useDfs = true}) {
    Node<E> foundNode;
    var handler = (node) {
      if (node.value == value) foundNode = node;
      return node.value != value;
    };
    useDfs ? dfs<E>(node, handler) : bfs<E>(node, handler);
    return foundNode;
  }

  /// This function uses Depth First Search (DFS) to find a [value].
  ///
  /// returns a [Node<T>] whose value equals [value].
  /// returns [null] if graph is empty or a matching Node for [value] isn't found
  static void dfs<E>(Node<E> node, NodeHandler nodeHandler) {
    final stack = <Node<E>>[node]; // initialize stack and add the node to it.
    final visitedList = [node]; // initialize visitedList and add node to it.
    var continueSearch = true; // initialize loop short-circuit.
    while (stack.isNotEmpty && continueSearch) {
      var nextNode = stack.removeLast(); // remove node from stack
      continueSearch = nodeHandler(nextNode); // determine whether to short-circuit.
      final unVisitedEdges = nextNode.edges.where( // get list of unVisited edge nodes.
              (edge) => !visitedList.contains(edge)
      ).toList();
      stack.addAll(unVisitedEdges
        ..forEach((edge) => visitedList.add(edge))
      ); // Push all unvisited nodes to stack and add them to the visited list.
    }
  }

  /// This function uses Depth First Search (DFS) to find a [value].
  ///
  /// returns a [Node<T>] whose value equals [value].
  /// returns [null] if graph is empty or a matching Node for [value] isn't found
  static void bfs<E>(Node<E> node, NodeHandler nodeHandler) {
    final queue = <Node<E>>[node]; // initialize queue and add the node to it.
    final visitedList = [node]; // initialize visitedList and add node to it.
    var continueSearch = true; // initialize loop short-circuit.
    while (queue.isNotEmpty && continueSearch) {
      var nextNode = queue.removeAt(0); // remove node from queue
      continueSearch = nodeHandler(nextNode); // determine whether to short-circuit.
      final unVisitedEdge = nextNode.edges.where( // get list of unVisited edge nodes.
              (edge) => !visitedList.contains(edge)
      ).toList();
      queue.addAll(unVisitedEdge..forEach((edge) => visitedList.add(edge))
      ); // Queue up unvisited nodes and add them to the visited list.
    }
  }
}