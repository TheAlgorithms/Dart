import 'package:test/test.dart';

/*N-Queens Problem

N - Queens problem is to place n - queens in such a manner 
on an n x n chessboard that no queens attack each other by being in the same row, column or diagonal
We have to find maximum no of solutions that are possible.
You can learn more about from the following link :https://www.geeksforgeeks.org/printing-solutions-n-queen-problem/
.*/

// Chess board, A 2d List of integers

List<List<int>> board = [];

// checking is it safe place for a queen ?

/*size : no of rows or columns of the given chess board 
  for e.g if there is a 3*3 chessboard then size = 3*/

bool isSafe(int size, int row, int col) {
  //checking column safe
  for (int k = 0; k < row; k++) {
    if (board[k][col] == 1) {
      return false;
    }
  }
  int i = row;
  int j = col;

  //checking left diagonal safe
  while (i >= 0 && j >= 0) {
    if (board[i][j] == 1) {
      return false;
    }
    j--;
    i--;
  }
  //checking right diagonal safe
  i = row;
  j = col;
  while (i >= 0 && j < size) {
    if (board[i][j] == 1) {
      return false;
    }
    j++;
    i--;
  }
  return true;
}

int solveNQueen(int row, int size) {
  //base case
  if (size == row) {
    return 1;
  }
  //recursive case
  int ways = 0;
  for (int col = 0; col < size; col++) {
    //whether the current i,j is safe or not
    if (isSafe(size, row, col)) {
      board[row][col] = 1;
      ways += solveNQueen(row + 1, size);

      //backtrack
      board[row][col] = 0;
    }
  }
  return ways;
}

//This Function is used to refilled board with default value for testing purpose only.
// You can remove it, if you are using single test case.
void resetBoard(int boardSize) {
  board = List.generate(boardSize, (i) => List.generate(boardSize, (j) => 0));
}

void main() {
  /* 
  Test Cases
  Size Expected Values
  1 :  1
  2 :  0
  3 :  0
  4 :  2
  5 :  10
  6 :  4
  7 :  40
  8 :  92
  9 :  352
  10 : 724

  */
  test("N Queen #testcase 1", () {
    resetBoard(1);
    expect(solveNQueen(0, 1), equals(1));
  });

  test("N Queen #testcase 2", () {
    resetBoard(2);
    expect(solveNQueen(0, 2), equals(0));
  });

  test("N Queen #testcase 3", () {
    resetBoard(3);
    expect(solveNQueen(0, 3), equals(0));
  });

  test("N Queen #testcase 4", () {
    resetBoard(4);
    expect(solveNQueen(0, 4), equals(2));
  });

  test("N Queen #testcase 5", () {
    resetBoard(5);
    expect(solveNQueen(0, 5), equals(10));
  });

  test("N Queen #testcase 6", () {
    resetBoard(6);
    expect(solveNQueen(0, 6), equals(4));
  });

  test("N Queen #testcase 7", () {
    resetBoard(7);
    expect(solveNQueen(0, 7), equals(40));
  });

  test("N Queen #testcase 8", () {
    resetBoard(8);
    expect(solveNQueen(0, 8), equals(92));
  });
  test("N Queen #testcase 9", () {
    resetBoard(9);
    expect(solveNQueen(0, 9), equals(352));
  });
  test("N Queen #testcase 10", () {
    resetBoard(10);
    expect(solveNQueen(0, 10), equals(724));
  });
}
