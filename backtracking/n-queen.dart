import 'dart:io';
import 'package:test/test.dart';

/*N-Queens Problem

N - Queens problem is to place n - queens in such a manner 
on an n x n chessboard that no queens attack each other by being in the same row, column or diagonal
We have to find maximum no of solutions that are possible.

.*/

// board
List<List<int>> board = [];

// checking is it safe place for a queen.
bool isSafe(int n, int x, int y) {
  //checking column safe
  for (int k = 0; k < x; k++) {
    if (board[x][y] == 1) {
      return false;
    }
  }
  int i = x;
  int j = y;

  //checking left diagonal safe
  while (i >= 0 && j >= 0) {
    if (board[i][j] == 1) {
      return false;
    }
    j--;
    i--;
  }
  //checking right diagonal safe
  i = x;
  j = y;
  while (i >= 0 && j < n) {
    if (board[i][j] == 1) {
      return false;
    }
    j++;
    i--;
  }
  return true;
}

void printBoard(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write(board[i][j]);
    }
    stdout.write("\n");
  }
  stdout.write("\n");
}

int SolveNQueen(int i, int n) {
  //base case
  if (i == n) {
    return 1;
  }
  //recursive case
  int ways = 0;
  for (int j = 0; j < n; j++) {
    //whether the current i,j is safe or not
    if (isSafe(n, i, j)) {
      board[i][j] = 1;
      ways += SolveNQueen(i + 1, n);

      //backtrack
      board[i][j] = 0;
    }
  }
  return ways;
}

int main() {
  test("N Queen #testcase 1", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 1);
    equals(1);
  });
  test("N Queen #testcase 2", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 2);
    equals(0);
  });
  test("N Queen #testcase 3", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 3);
    equals(0);
  });
  test("N Queen #testcase 4", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 4);
    equals(2);
  });
  test("N Queen #testcase 5", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 5);
    equals(10);
  });
  test("N Queen #testcase 6", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 6);
    equals(4);
  });
  test("N Queen #testcase 7", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 7);
    equals(40);
  });
  test("N Queen #testcase 8", () {
    board = List.generate(20, (i) => List.generate(20, (j) => 0));
    SolveNQueen(0, 8);
    equals(92);
  });
  return 0;
}
