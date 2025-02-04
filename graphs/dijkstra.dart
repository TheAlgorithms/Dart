const int MAX_VALUE = 1000000;

class Dijkstra {
  int minDist(List<int> dist, List<bool> visited) {
    int min = MAX_VALUE, min_index = -1;
    for (int v = 0; v < dist.length; v++) {
      if (visited[v] == false && dist[v] <= min) {
        min = dist[v];
        min_index = v;
      }
    }
    return min_index;
  }

  void dijkstra(List<List<int>> graph, int src) {
    List<int> dist = List.filled(graph.length, MAX_VALUE);
    List<bool> visited = List.filled(graph.length, false);

    dist[src] = 0;
    for (int count = 0; count < graph.length - 1; count++) {
      int u = minDist(dist, visited);
      visited[u] = true;
      for (int v = 0; v < graph.length; v++) {
        if (!visited[v] &&
            graph[u][v] != 0 &&
            dist[u] != MAX_VALUE &&
            dist[u] + graph[u][v] < dist[v]) {
          dist[v] = dist[u] + graph[u][v];
        }
      }
    }
    printSolution(dist);
  }

  void printSolution(List<int> dist) {
    print("Vertex   Distance from Source");
    for (int i = 0; i < dist.length; i++) {
      print(i.toString() + " ------------> " + dist[i].toString());
    }
  }
}

void main() {
  List<List<int>> graph = [
    [0, 4, 0, 0, 0, 0, 0, 8, 0],
    [4, 0, 8, 0, 0, 0, 0, 11, 0],
    [0, 8, 0, 7, 0, 4, 0, 0, 2],
    [0, 0, 7, 0, 9, 14, 0, 0, 0],
    [0, 0, 0, 9, 0, 10, 0, 0, 0],
    [0, 0, 4, 14, 10, 0, 2, 0, 0],
    [0, 0, 0, 0, 0, 2, 0, 1, 6],
    [8, 11, 0, 0, 0, 0, 1, 0, 7],
    [0, 0, 2, 0, 0, 0, 6, 7, 0]
  ];
  Dijkstra dij = new Dijkstra();
  dij.dijkstra(graph, 0);
}
