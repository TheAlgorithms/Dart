import 'dart:io';

import 'package:test/test.dart';

List<List<int>> getValidPos(List<int> position, int n) {
  final i = position[0];
  final j = position[1];
  final positions = [
    [i + 1, j + 2],
    [i - 1, j + 2],
    [i + 1, j - 2],
    [i - 1, j - 2],
    [i + 2, j + 1],
    [i + 2, j - 1],
    [i - 2, j + 1],
    [i - 2, j - 1],
  ];

  final List<List<int>> permissiblePositions = [];
  for (final currPosition in positions) {
    final iTest = currPosition[0];
    final jTest = currPosition[1];
    if (0 <= iTest && iTest < n && 0 <= jTest && jTest < n) {
      permissiblePositions.add(currPosition);
    }
  }
  return permissiblePositions;
}

bool isComplete(List<List<int>> board) {
  for (final row in board) {
    for (final elem in row) {
      if (elem == 0) {
        return false;
      }
    }
  }
  return true;
}

bool openKnightTourHelper(List<List<int>> board, List<int> pos, int curr) {
  if (isComplete(board)) {
    return true;
  }

  for (final position in getValidPos(pos, board.length)) {
    final i = position[0];
    final j = position[1];

    if (board[i][j] == 0) {
      board[i][j] = curr + 1;
      if (openKnightTourHelper(board, position, curr + 1)) {
        return true;
      }
      board[i][j] = 0;
    }
  }
  return false;
}

List<List<int>> openKnightTour(int n) {
  // board creation
  final List<List<int>> board = [];
  for (var i = 0; i < n; i++) {
    final List<int> row = [];
    for (var j = 0; j < n; j++) {
      row.add(0);
    }
    board.add(row);
  }
  // open knight tour with backtracking
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < n; j++) {
      board[i][j] = 1;
      if (openKnightTourHelper(board, [i, j], 1)) {
        return board;
      }
      board[i][j] = 0;
    }
  }
  return board;
}

void printBoard(List<List<int>> board) {
  for (final row in board) {
    for (final elem in row) {
      stdout.write(elem);
    }
    stdout.write("\n");
  }
  stdout.write("\n");
}

void main() {
  test(('getValidPos: testCase #1'), () {
    expect(
        getValidPos([1, 3], 4),
        equals([
          [2, 1],
          [0, 1],
          [3, 2]
        ]));
  });

  test(('getValidPos: testCase #3'), () {
    expect(
        getValidPos([1, 2], 5),
        equals([
          [2, 4],
          [0, 4],
          [2, 0],
          [0, 0],
          [3, 3],
          [3, 1]
        ]));
  });

  test(('isComplete: testCase #1'), () {
    expect(
        isComplete([
          [1]
        ]),
        equals(true));
  });

  test(('isComplete: testCase #2'), () {
    expect(
        isComplete([
          [1, 2],
          [3, 0]
        ]),
        equals(false));
  });

  test(('openKnightTour: testCase #1'), () {
    expect(
        openKnightTour(1),
        equals([
          [1]
        ]));
  });

  test(('openKnightTour: testCase #2'), () {
    expect(
        openKnightTour(2),
        equals([
          [0, 0],
          [0, 0]
        ]));
  });

  test(('openKnightTour: testCase #3'), () {
    expect(
        openKnightTour(5),
        equals([
          [1, 14, 19, 8, 25],
          [6, 9, 2, 13, 18],
          [15, 20, 7, 24, 3],
          [10, 5, 22, 17, 12],
          [21, 16, 11, 4, 23]
        ]));
  });
}
