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
   for (var i = a.length; i > 0; i--)
     for (var j = 0; j < i - 1; j++)
       if (a[j] > a[j + 1]) //swap
       {
         var t = a[j + 1];
         a[j + 1] = a[j];
         a[j] = t;
       }
}
