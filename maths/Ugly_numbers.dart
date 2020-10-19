import 'package:test/test.dart';

int maxDivide(int a, int b) {
  var n;
  while (a % b == 0) {
    n = a / b;
    a = n.toInt();
  }
  return a;
}

/* Function to check if a number is ugly or not */
bool isUgly(int no) {
  no = maxDivide(no, 2);
  no = maxDivide(no, 3);
  no = maxDivide(no, 5);

  return no == 1;
}

/* Function to get the nth ugly number*/
int getNthUglyNo(int n) {
  int i = 1;
  int count = 1; /* ugly number count */

/*Check for all integers untill ugly count 
	becomes n*/
  while (n > count) {
    i++;
    if (isUgly(i) == 1) count++;
  }
  return i;
}

/* Driver program to test above functions */
void main() {
  var no = getNthUglyNo(150);
  print('150th ugly no. is $no');
}
