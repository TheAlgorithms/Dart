import 'package:test/test.dart';

List N_bonacci(int n, int m) {
  List v = new List(m);
  var i;
  for (i = 0; i < m; i++) {
    v[i] = 0;
  }
  v[n - 1] = 1;
  v[n] = 1;
  for (i = n + 1; i < m; i++) {
    v[i] = 2 * v[i - 1] - v[i - 1 - n];
  }

  print(v);
}

void main() {
  N_bonacci(5, 10);
  N_bonacci(4, 12);
  N_bonacci(6, 13);
  N_bonacci(8, 19);
}
