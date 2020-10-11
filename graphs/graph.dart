import '../queue/queue.dart';

class Graph<T> {
  int edges = 0;
  Map<T, List<T>> adjList = <T, List<T>>{};
  Set<T> markSet = new Set<T>();

  addEdge(T v, T w) {
    if (adjList[v] == null) {
      adjList[v] = <T>[];
    }
    adjList[v].add(w);
    if (adjList[w] == null) {
      adjList[w] = <T>[];
    }
    adjList[w].add(v);
    edges++;
  }

  dfs(T v) {
    markSet.clear();
    _dfs(v);
  }

//function for depth first search
  _dfs(T v) {
    markSet.add(v);
    if (adjList.containsKey(v)) {
      print("Visited vertex: $v");
      for (T n in adjList[v]) {
        if (!markSet.contains(n)) {
          _dfs(n);
        }
      }
    }
  }

//fuction for breadth first search

  bfs(T v) {
    markSet.clear();
    var queue = new Queue<T>();
    markSet.add(v);
    queue.enqueue(v);
    while (!queue.isEmpty) {
      var p = queue.dequeue();
      print('Visited vertex: $p');
      for (T n in adjList[p]) {
        if (!markSet.contains(n)) {
          markSet.add(n);
          queue.enqueue(n);
        }
      }
    }
  }

  String toString() {
    var s = '';
    for (T v in adjList.keys) {
      s += v.toString() + ' -> ';
      for (T n in adjList[v]) {
        s += n.toString() + ' ';
      }
      s += '\n';
    }
    return s;
  }
}
