import 'dart:math' show Random;

// quickSort
// O(n*log n)
void main() {
  var list = List<int>();
  Random random = new Random();
  for (var i = 0; i < 100; i++) {
    list.add(random.nextInt(100));
  }
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  print(quickSort(list));
}

List<int> quickSort(List<int> a) {
  if (a.length < 2) {
    return a;
  } else {
    var pivot = a[0];
    var less = <int>[];
    var greater = <int>[];
    a.removeAt(0);
    for (var i in a) {
      if (i <= pivot) {
        less.add(i);
      } else {
        greater.add(i);
      }
    }
    return quickSort(less) + [pivot] + quickSort(greater);
  }
}
