int linear_search(List<int> a, number) {
  for (int i = 0; i < a.length; i++) {
    if (a[i] == number) {
      return i;
    }
  }
  return -1;
}

void main() {
  List<int> list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  int x = 15;
  int index = linear_search(list, x);
  print('list:');
  print(list);
  if (index != -1) {
    print('$x found at positions: $index');
  } else {
    print('$x Not found');
  }
}
