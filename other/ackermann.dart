/// Here be dragons
int ackermann(int m, int n) {
  if (m == 0)
    return n + 1;
  else if (m > 0 && n == 0)
    return ackermann(m - 1, 1);
  else
    return ackermann(m - 1, ackermann(m, n - 1));
}

void main() {
  print("A(2, 2) = ${ackermann(2, 2)}");
  print("A(3, 3) = ${ackermann(3, 3)}");
  print("A(3, 4) = ${ackermann(3, 4)}");
  print("A(3, 5) = ${ackermann(3, 5)}");
  //print("A(4, 4)=${ackermann(4, 4)}"); /// too much recursionError raised right there
}
