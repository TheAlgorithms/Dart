/* Driver */
void main() {
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  int low = 0;
  int high = list.length - 1;

  assert(binarySearch(list, low, high, 5) == 5);
  assert(binarySearch(list, low, high, 9) == 9);
  assert(binarySearch(list, low, high, 66) == -1);
}

/**
 * Return the index of [key] value in [list]
 */
int binarySearch(List<int> list, int low, int high, int key) {
  if (low > high) {
    return -1; /* not found */
  }
  int mid = (low + high) >> 1;
  if (key == list[mid]) {
    return mid; /* found */
  } else if (key > list[mid]) {
    return binarySearch(
        list, mid + 1, high, key); /* search in range[mid + 1, high] */
  } else {
    return binarySearch(
        list, low, mid - 1, key); /* search in range[low, mid - 1] */
  }
}
