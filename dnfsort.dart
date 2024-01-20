
// Dutch National Flag (DNF) - It is a programming problem proposed by Edsger Dijkstra. The flag of the Netherlands consists of three colors: white, red, and blue. ... For DNF (Dutch National Flag), we sort an array of 0, 1, and 2's in linear time that does not consume any extra space.


import 'package:test/test.dart';
import 'dart:core';
List dnf_Sort(List<int> a, int arrsize) {
    int low = 0;
    int high = (arrsize - 1);
    int mid = 0;
    int temp = 0;
    while (mid <= high) {
      switch (a[mid]) {
        case 0:
          temp = a[low];
          a[low] = a[mid];
          a[mid] = temp;
          low++;
          mid++;
          break;
        case 1:
          mid++;
          break;
        case 2:
          temp = a[mid];
          a[mid] = a[high];
          a[high] = temp;
          high--;
          break;
      }
    }
    return a;
  }

  void main(List<String> args)
  {
    List<int> arr = [2,2,1,0,0,1];
    int arrSize = arr.length;
    dnf_Sort(arr, arrSize);
    print("Array after seggregation ");
    print("$arr");
    test('test 1', () {
      arr= [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
      arrSize = arr.length;
      expect(dnf_Sort(arr,arrSize), [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2]);
    });
    test('test 2', () {
      arr = [1];
      arrSize = arr.length;
      expect(dnf_Sort(arr,arrSize), [1]);
    });
    test('test 3', () {
      arr = [2,0,1,0,0,1];
      arrSize = arr.length;
      expect(dnf_Sort(arr,arrSize), [0,0,0,1,1,2]);
    });
    test('test 4', () {
    arr= [];
    arrSize = arr.length;
    expect(sort012(arr,arrSize), []);
  });
  }
