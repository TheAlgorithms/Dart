import 'dart:math' show Random;

//main function,the program start
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  selectSort(list);
  print(list);
}

void selectSort(List<int> a) {
  for (var i = 0; i < a.length - 1; i++) {
    var mi = i;
    for (var j = i + 1; j < a.length; j++) {
      if (a[j] < a[mi]) mi = j;
    }
    if (i != mi) {
      var t = a[i];
      a[i] = a[mi];
      a[mi] = t;
    }
  }
}
