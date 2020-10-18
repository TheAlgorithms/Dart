import 'package:test/test.dart';

bool Magic_no(var x) {
  var result = x % 9;
  if (result != 1) {
    return false;
  } else
    return true;
}

void main() {
  for (var x in [0, 10, 370, 371, 509, 501]) {
    if (Magic_no(x)) {
      print("${x} is magic number");
    } else {
      print("${x} is not magic number");
    }
  }
}
