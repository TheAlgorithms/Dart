import 'dart:math';

bool Armstrong_no(var x) {
  var n = x;
  var s = n.toString();
  var d = s.length;
  var sum = 0;
  while (n != 0) {
    var r = n % 10;
    sum = sum + pow(r, d).toInt();
    n = n ~/ 10;
  }
  return sum == x;
}

void main() {
  for (var x in [0, 10, 370, 371]) {
    if (Armstrong_no(x)) {
      print("${x} is armstrong number");
    } else {
      print("${x} is not Armstrong number");
    }
  }
}
