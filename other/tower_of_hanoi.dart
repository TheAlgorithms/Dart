moveDisk(String fp, String tp) {
  print('moving disk from ' + fp + ' to ' + tp);
}

moveTower(int height, var fromPole, var toPole, var withPole) {
  if (height >= 1) {
    moveTower(height - 1, fromPole, withPole, fromPole);
    moveDisk(fromPole, toPole);
    moveTower(height - 1, withPole, toPole, fromPole);
  }
}

void main() {
  int height = 3;
  moveTower(height, 'A', 'B', 'C');
  /*
  moving disk from A to A
  moving disk from A to C
  moving disk from A to C
  moving disk from A to B
  moving disk from C to A
  moving disk from C to B
  moving disk from A to B
  */
}
