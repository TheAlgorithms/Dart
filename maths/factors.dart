void main() {
  print("factors: ${factorsOf(12)}"); //factors: [1, 2, 3, 4, 6, 12]

  try {
    print(factorsOf(-1)
        .toString()); //Unhandled exception: Exception: A non-positive value was passed to the function
  } catch (ex) {
    print(ex);
  }
}

List<int> factorsOf(int num) {
  if (num <= 0)
    throw Exception("A non-positive value was passed to the function");
  List<int> factors = [1];
  for (int i = 2; i <= num; i++) {
    if (num % i == 0) factors.add(i);
  }
  return factors;
}
