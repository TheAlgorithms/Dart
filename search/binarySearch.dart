import '../sort/test/utils.dart';

int binary_search(List<int> a, int l, int r, int x) {

  if(!isSorted(a)) throw new ArgumentError("Input list for binary search must be sorted.");

  if (r >= l) {
    int middle = (l + (r - l) / 2).toInt();

    //If the element is present at middle
    if (a[middle] == x) {
      return middle;
    }

    //If the element is smaller than middle
    if (a[middle] > x) {
      return binary_search(a, l, middle - 1, x);
    }

    return binary_search(a, middle + 1, r, x);
  }
  return -1;
}

void main() {
  var list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var x = 55;
  int n = list.length;
  var index = binary_search(list, 0, n - 1, x);
  print('list:');
  print(list);
  if (index != -1) {
    print(x.toString() + ' found at positions: ' + index.toString());
  } else {
    print(x.toString() + ' Not found');
  }
}
