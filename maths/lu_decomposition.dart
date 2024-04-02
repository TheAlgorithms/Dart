/// Based on https://en.wikipedia.org/wiki/LU_decomposition

import 'dart:math';

void swap<T>(List<T> collection, int index1, int index2) {
  T temp = collection[index1];
  collection[index1] = collection[index2];
  collection[index2] = temp;
}

class MatrixDimensionError extends Error {}

class NonInvertibleMatrixError extends Error {}

class LUPDecomposition {
  Matrix lu;
  List<int> pivot;

  LUPDecomposition(this.lu, this.pivot);
}

class Matrix {
  List<List<double>> values;

  @override
  String toString() => this.values.toString();

  int get nRows => this.values.length;
  int get nColumns => this.nRows == 0 ? 0 : this.values[0].length;

  bool get isSquare => this.nRows == this.nColumns;

  List<List<double>> get rows => this.values;

  List<double> operator [](int n) => this.values[n];

  Matrix operator +(Matrix other) {
    if (this.nRows != other.nRows || this.nColumns != other.nColumns) {
      throw new MatrixDimensionError();
    }

    List<List<double>> values = [];
    for (int i = 0; i < this.nRows; i++) {
      List<double> newRow = [];
      for (int j = 0; j < this.nColumns; j++) {
        newRow.add(this[i][j] + other[i][j]);
      }
      values.add(newRow);
    }

    return new Matrix(values: values);
  }

  Matrix operator -(Matrix other) {
    if (this.nRows != other.nRows || this.nColumns != other.nColumns) {
      throw new MatrixDimensionError();
    }

    List<List<double>> values = [];
    for (int i = 0; i < this.nRows; i++) {
      List<double> newRow = [];
      for (int j = 0; j < this.nColumns; j++) {
        newRow.add(this[i][j] - other[i][j]);
      }

      values.add(newRow);
    }

    return new Matrix(values: values);
  }

  Matrix times(double n) {
    Matrix output = Matrix.from(this);

    for (int i = 0; i < output.nRows; i++) {
      for (int j = 0; j < output.nColumns; j++) {
        output[i][j] *= n;
      }
    }

    return output;
  }

  Matrix operator *(Matrix other) {
    if (this.nColumns != other.nRows) {
      throw new MatrixDimensionError();
    }

    List<List<double>> values = [];
    for (int i = 0; i < this.nRows; i++) {
      List<double> newRow = [];
      for (int j = 0; j < other.nColumns; j++) {
        double sum = 0;
        for (int k = 0; k < this.nColumns; k++) {
          sum += this[i][k] * other[k][j];
        }
        newRow.add(sum);
      }
      values.add(newRow);
    }

    return new Matrix(values: values);
  }

  LUPDecomposition decompose() {
    if (!this.isSquare) {
      throw new MatrixDimensionError();
    }

    int matrixSize = this.nRows;
    List<int> pivot = List.generate(matrixSize + 1, (x) => x);
    Matrix output = Matrix.from(this);

    for (int i = 0; i < matrixSize; i++) {
      double maxValue = 0;
      int maxIndex = i;

      for (int j = i; j < matrixSize; j++) {
        if (output[j][i].abs() > maxValue) {
          maxValue = output[j][i].abs();
          maxIndex = j;
        }
      }

      if (maxIndex != i) {
        swap(pivot, i, maxIndex);
        swap(output.rows, i, maxIndex);

        pivot[matrixSize]++;
      }

      for (int j = i + 1; j < matrixSize; j++) {
        output[j][i] /= output[i][i];

        for (int k = i + 1; k < matrixSize; k++) {
          output[j][k] -= output[j][i] * output[i][k];
        }
      }
    }

    return LUPDecomposition(output, pivot);
  }

  Matrix transposition() {
    Matrix output = Matrix.zeros(nColumns, nRows);

    for (int i = 0; i < output.nRows; i++) {
      for (int j = 0; j < output.nColumns; j++) {
        output[i][j] = this[j][i];
      }
    }

    return output;
  }

  Matrix inversion() {
    if (!this.isSquare) {
      throw new MatrixDimensionError();
    }

    LUPDecomposition decomposition = this.decompose();
    Matrix output = Matrix.from(decomposition.lu);

    int matrixSize = decomposition.lu.nRows;

    for (int i = 0; i < matrixSize; i++) {
      for (int j = 0; j < matrixSize; j++) {
        output[j][i] = decomposition.pivot[j] == i ? 1 : 0;

        for (int k = 0; k < j; k++) {
          output[j][i] -= decomposition.lu[j][k] * output[k][i];
        }
      }

      for (int j = matrixSize - 1; j >= 0; j--) {
        for (int k = j + 1; k < matrixSize; k++) {
          output[j][i] -= decomposition.lu[j][k] * output[k][i];
        }
        output[j][i] /= decomposition.lu[j][j];
      }
    }

    return output;
  }

  double determinant() {
    if (this.nRows == 0 || this.nColumns == 0) {
      throw MatrixDimensionError();
    }

    LUPDecomposition decomposition = decompose();
    int matrixSize = decomposition.lu.nColumns;
    double product = decomposition.lu[0][0];

    for (int i = 1; i < matrixSize; i++) {
      product *= decomposition.lu[i][i];
    }

    if (decomposition.pivot[matrixSize] - matrixSize % 2 == 0) {
      return product;
    } else {
      return -product;
    }
  }

  Matrix.eye(int size, {this.values = const []}) {
    this.values = [];

    for (int i = 0; i < size; i++) {
      List<double> row = List.generate(size, (x) => 0);
      row[i] = 0;
      this.values.add(row);
    }
  }

  Matrix.from(Matrix matrix, {this.values = const []}) {
    this.values = matrix.rows.map((row) => List<double>.from(row)).toList();
  }

  Matrix.zeros(int nRows, int nColumns, {this.values = const []}) {
    this.values = [];

    for (int i = 0; i < nRows; i++) {
      List<double> row = [];
      for (int j = 0; j < nColumns; j++) {
        row.add(0);
      }
      this.values.add(row);
    }
  }

  Matrix({List<List<double>> this.values = const []}) {
    if (values.length != 0) {
      int rowLength = values[0].length;
      if (values.any((row) => row.length != rowLength)) {
        throw new MatrixDimensionError();
      }
    }

    this.values = values;
  }
}

List<double> solve(Matrix x, List<double> y) {
  if (x.nColumns != y.length) {
    throw new MatrixDimensionError();
  }
  LUPDecomposition decomposition = x.decompose();

  int matrixHeight = x.nColumns;
  List<double> output = List.generate(matrixHeight, (x) => 0);

  for (int i = 0; i < matrixHeight; i++) {
    output[i] = y[decomposition.pivot[i]];

    for (int j = 0; j < i; j++) {
      output[i] -= decomposition.lu[i][j] * output[j];
    }
  }

  for (int i = matrixHeight - 1; i >= 0; i--) {
    for (int j = i + 1; j < matrixHeight; j++) {
      output[i] -= decomposition.lu[i][j] * output[j];
    }

    output[i] /= decomposition.lu[i][i];
  }

  return output;
}

List<double> ordinaryLeastSquare(Matrix x, Matrix y) {
  return ((x.transposition() * x).inversion() * x.transposition() * y)
      .transposition()
      .rows[0];
}

double f(double x, double y) {
  return (2 * x) + (6 * y) + 4;
}

void main() {
  Matrix a = new Matrix(values: [
    [3, 2, -1],
    [2, -2, 4],
    [-1, 0.5, -1]
  ]);
  List<double> b = [1, -2, 0];

  List<double> solution = solve(a, b);
  print("x=${solution[0]}, y=${solution[1]}, z=${solution[2]}");

  Matrix input = Matrix.zeros(10, 3);
  Matrix output = Matrix.zeros(10, 1);

  Random rng = new Random();
  for (int i = 0; i < 10; i++) {
    double x = rng.nextInt(100).toDouble() + rng.nextDouble();
    double y = rng.nextInt(100).toDouble() + rng.nextDouble();

    input[i][0] = x;
    input[i][1] = y;
    input[i][2] = 1;

    output[i][0] = f(x, y);
  }
  List<double> coeffs = ordinaryLeastSquare(input, output);
  print("f(x, y) = x * ${coeffs[0]} + y * ${coeffs[1]} + ${coeffs[2]}");
}
