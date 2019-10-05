import 'dart:math' show Random;

//main function,the program start
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  bubbleSort(list);
  print(list);
}

void bubbleSort(List<int> a) {
  for (var i = 0, length = a.length; i < length - 1; ++i) {
    bool swapped = false;
    for (var j = 0; j < length - 1 - i; ++j) {
      if (a[j] > a[j + 1]) {
        /* swap */
        var temp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) {
      break; /* array has been sorted */
    }
  }
}
