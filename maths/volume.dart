import 'dart:math' show pi;

import 'package:test/test.dart';

/* 
 ** Program to calculate the volume of the shapes
 ** Reference: https://www.cuemath.com/measurement/volume
*/

/* Calculate the volume for a Cuboid */
double volCuboid(double l, double b, double h) {
  return l * b * h;
}

/* Calculate the volume for a Cube */
double volCube(double a) {
  return power(a, 3);
}

/* Calculate the volume for a Cone */
double volCone(double r, double h) {
  return pi * power(r, 2) * h / 3;
}

/* Calculate the volume for a Cylinder */
double volCylinder(double r, double h) {
  return pi * power(r, 2) * h;
}

/* Calculate the volume for a Sphere  */
double volSphere(double r) {
  return pi * power(r, 3) * 4 / 3;
}

/* Calculate the volume for a Hemisphere */
double volHemisphere(double r) {
  return pi * power(r, 3) * 2 / 3;
}

/* Calculate the volume for a Pyramid */
double volPyramid(double baseLength, double baseWidth, double height) {
  return baseLength * baseWidth * height / 3;
}

/* Calculate the volume for a Triangular Prism */
double volTriangularPrism(double baseLengthTriangle, double heightTriangle, double height) {
  return (baseLengthTriangle * heightTriangle * height) / 2;
}

/* Calculate the volume for a Pentagonal Prism */
double volPentagonalPrism(double pentagonalLength, double pentagonalBaseLength, double height) {
  return pentagonalLength * pentagonalBaseLength * height * 5 / 2;
}

double power(double x, int n) {
  double retval = 1;
  for (int i = 0; i < n; i++) {
    retval *= x;
  }
  return retval;
}

/* Driver program to test above functions */
main() {
  test("volCuboid(2.0, 5.0, 3) returns 30.0", () {
    expect(volCuboid(2.0, 5.0, 3), equals(30.0));
  });

  test("volCube(2.0) returns 8.0", () {
    expect(volCube(2.0), equals(8.0));
  });

  test("volCone(3.0, 8.0) returns 75.39822368615503", () {
    expect(volCone(3.0, 8.0), equals(75.39822368615503));
  });

  test("volPyramid(2.0, 3.0, 8.0) returns 16.0", () {
    expect(volPyramid(2.0, 3.0, 8.0), equals(16.0));
  });

  test("volCylinder(3.0, 8.0) returns 226.1946710584651", () {
    expect(volCylinder(3.0, 8.0), equals(226.1946710584651));
  });

  test("volTriangularPrism(3.0, 6.0, 8.0) returns 72.0", () {
    expect(volTriangularPrism(3.0, 6.0, 8.0), equals(72.0));
  });

  test("volPentagonalPrism(1.0, 4.0, 8.0) returns 80.0", () {
    expect(volPentagonalPrism(1.0, 4.0, 8.0), equals(80.0));
  });

  test("volSphere(4.0) returns 268.082573106329", () {
    expect(volSphere(4.0), equals(268.082573106329));
  });

  test("volHemisphere(4.0) returns 134.0412865531645", () {
    expect(volHemisphere(4.0), equals(134.0412865531645));
  });
}
