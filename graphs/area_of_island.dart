import 'package:test/test.dart';

extension MinMax on List<int> {
  int get max {
    num maxNumber = double.negativeInfinity;
    for (int i = 0; i < length; ++i) {
      if (maxNumber < this[i]) {
        maxNumber = this[i];
      }
    }
    if (maxNumber != double.negativeInfinity) {
      return maxNumber.toInt();
    }
    return 0;
  }
}

const List<List<int>> deltas = [
  [-1, 0], // top neighbour
  [0, 1], // right neighbour
  [1, 0], // bottom neighbour
  [0, -1] // left neighbour.
];

int maxAreaOfIsland(List<List<int>> grid) {
  int numRows = grid.length;
  int numCols = grid[0].length;
  List<List<bool>> visited =
      List.generate(numRows, (int index) => List.filled(numCols, false));

  List<int> areas = [];
  for (int i = 0; i < numRows; ++i) {
    for (int j = 0; j < numCols; ++j) {
      if (visited[i][j] || grid[i][j] == 0) continue;
      traverseNode(i, j, grid, visited, areas);
    }
  }
  return areas.max;
}

bool isInvalidIndex(int i, int j, int rowCount, int colCount) {
  return (i < 0 || i >= rowCount || j >= colCount || j < 0);
}

List<List<int>> adjacentNodes(
    List<List<int>> grid, List<List<bool>> visited, int x, int y) {
  List<List<int>> nodes = [];
  for (int i = 0; i < deltas.length; ++i) {
    int dx = x + deltas[i][0];
    int dy = y + deltas[i][1];

    if (isInvalidIndex(dx, dy, grid.length, grid[0].length)) continue;
    if (visited[dx][dy] || grid[dx][dy] == 0) continue;

    nodes.add([dx, dy]);
  }
  return nodes;
}

void traverseNode(int i, int j, List<List<int>> grid, List<List<bool>> visited,
    List<int> areas) {
  int area = 0;
  List<List<int>> nodesToExplore = [
    [i, j]
  ];
  while (nodesToExplore.isNotEmpty) {
    List<int> node = nodesToExplore.removeLast();

    int x = node[0];
    int y = node[1];

    if (visited[x][y]) continue;
    visited[x][y] = true;
    if (grid[x][y] == 0) continue;

    area += 1;
    nodesToExplore.addAll(adjacentNodes(grid, visited, x, y));
  }
  if (area > 0) {
    areas.add(area);
  }
}

void main() {
  test('test case 1', () {
    List<List<int>> island = [
      [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
      [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
    ];
    expect(maxAreaOfIsland(island), 6);
  });

  test('test case 2', () {
    List<List<int>> island = [
      [0, 0, 1],
      [0, 0, 0],
      [0, 1, 1],
    ];
    expect(maxAreaOfIsland(island), 2);
  });

  test('test case 3', () {
    List<List<int>> island = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0],
    ];
    expect(maxAreaOfIsland(island), 0);
  });
}
