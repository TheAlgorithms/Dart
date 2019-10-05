void main() {
  List numbers = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10];
  int max = find_max_recursion(numbers, 0, numbers.length - 1);
  print("max = $max");
}

/**
 * find min using divide-and-conquer algorithm
 */
int find_max_recursion(List numbers, int low, int high) {
  if (low == high) {
    return numbers[low]; // or numbers[high]
  }
  int mid = (low + high) >> 1;
  int leftMax =
      find_max_recursion(numbers, low, mid); /* max in range [low mid] */
  int rightMax = find_max_recursion(
      numbers, mid + 1, high); /* max in range [mid + 1, high] */
  return leftMax >= rightMax ? leftMax : rightMax;
}
