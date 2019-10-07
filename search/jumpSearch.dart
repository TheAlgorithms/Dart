import 'dart:math' show sqrt;

min(X, Y) {
  if (X < Y) {
    return X;
  } else {
    return Y;
  }
}

int jump_search(List a, int x) {
  int n = a.length;
  int step = sqrt(n).floor().toInt();
  int prev = 0;
  while (a[min(step, n) - 1] < x) {
    prev = step;
    step += sqrt(n).floor().toInt();
    if (prev >= n) {
      return -1;
    }
  }
  while (a[prev] < x) {
    prev = prev + 1;
    if (prev == min(step, n)) {
      return -1;
    }
  }
  if (a[prev] == x) {
    return prev;
  }
  return -1;
}

void main() {
  var list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var x = 55;
  var index = jump_search(list, x);
  print('list:');
  print(list);
  print('Number ' + x.toString() + ' is at index ' + index.toString());
}
