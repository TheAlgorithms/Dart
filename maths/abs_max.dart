/* Driver */
void main() {
  assert(absMax([0, 5, 1, 11]) == 11);
  assert(absMax([3, -10, -2]) == -10);
}

/**
 * get the value in [list], it's absolute value is max
 * Examples:
 * absMax([0, 5, 1, 11]) = 11, absMax([3 , -10, -2]) = -10
 */
int absMax(List<int> list) {
  int max = list[0];
  for (int i = 1, length = list.length; i < length; ++i) {
    if (list[i].abs() > max.abs()) {
      max = list[i];
    }
  }
  return max;
}
