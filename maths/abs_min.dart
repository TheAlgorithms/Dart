/* Driver */
void main() {
  assert(absMin([0, 5, 1, 11]) == 0);
  assert(absMin([3, -10, -2]) == -2);
}

/**
 * get the value in [list], it's absolute value is min
 * Examples:
 *      absMin([0, 5, 1, 11]) = 0, absMin([3 , -10, -2]) = -2
 */
int absMin(List<int> list) {
  int min = list[0];
  for (int i = 1, length = list.length; i < length; ++i) {
    if (list[i].abs() < min.abs()) {
      min = list[i];
    }
  }
  return min;
}
