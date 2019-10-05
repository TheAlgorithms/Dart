void main() {
  List numbers = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10];
  int min = find_min_recursion(numbers, 0, numbers.length - 1);
  print("min = $min");
}

/**
 * find max using divide-and-conquer algorithm
 */
int find_min_recursion(List numbers, int low, int high) {
  if (low == high) {
    return numbers[low]; // or numbers[high]
  }
  int mid = (low + high) >> 1;
  int leftMin =
      find_min_recursion(numbers, low, mid); /* min in range [low mid] */
  int rightMin = find_min_recursion(
      numbers, mid + 1, high); /* min in range [mid + 1, high] */
  return leftMin <= rightMin ? leftMin : rightMin;
}
