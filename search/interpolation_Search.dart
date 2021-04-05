/* By comparison, binary search always chooses the middle of the remaining
 * search space, discarding one half or the other, depending on the comparison
 * between the key found at the estimated position and the key sought. The remaining
 * search space is reduced to the part before or after the estimated position.
 * The linear search uses equality only as it compares elements one-by-one from the start, ignoring any sorting.
 * On average the interpolation search makes about log(log(n)) comparisons (if the elements
 * are uniformly distributed), where n is the number of elements to be searched. In the worst case
 * (for instance where the numerical values of the keys increase exponentially) it can make up to O(n) comparisons.
 * In interpolation-sequential search, interpolation is used to find an item near the one being searched for,
 * then linear search is used to find the exact item. */

//Author:Shawn
//Email:stepfencurryxiao@gmail.com

int interpolationSearch(List arr, int n, int key) {
  int low = 0, high = n - 1;
  while (low <= high && key >= arr[low] && key <= arr[high]) {
    /* Calculate the nearest possible position of key */
    int pos = low +
        (((key - arr[low]) * (high - low)) / (arr[high] - arr[low])).round();
    if (key > arr[pos])
      low = pos + 1;
    else if (key < arr[pos])
      high = pos - 1;
    else /* Found */
      return pos;
  }
  /* Not found */
  return -1;
}

int main() {
  //Get the arr
  List arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  //The size of the arr
  var n = arr.length;
  //The Key
  var key = 5;
  print("I want to found $key at $arr");
  //Get the index
  var index = interpolationSearch(arr, n, key);
  //print the result
  print("Element found at position: $index");
  return 0;
}
