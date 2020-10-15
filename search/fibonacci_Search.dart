//Title:Fibonacci Search
//Author:Shawn
//Email:stepfencurryxiao@gmail.com

int fibMaonaccianSearch(List arr, int x, int n) {
  //Initialize fibonacci numbers
  //(m - 2)'th Fibonacci No
  int fibMMm2 = 0;
  //(m - 2)'th Fibonacci No
  int fibMMm1 = 1;
  //m'th Fibonacci
  int fibM = fibMMm2 + fibMMm1;

  //fibM is going to store the smallest Fibonacci
  //Number greater than or equal to n
  while (fibM < n) {
    fibMMm2 = fibMMm1;
    fibMMm1 = fibM;
    fibM = fibMMm2 + fibMMm1;
  }

  // Marks the eliminated range from front
  int offset = -1;

  /*While three are elements to be inspected.
   * Note that we compare arr[fibMMm2] with x.
   * When fibM becomes 1,
   * fibMm2 becomes 0 */
  while (fibM > 1) {
    //Check if fibMMm2 is a valid location

    //sets i to the min. of (offset + fibMMm2) and (n - 1)
    int i = ((offset + fibMMm2) < (n - 1)) ? (offset + fibMMm2) : (n - 1);

    /* If x is greater than the value at index fibMmm2
     * cut the subarray array from offset to i
     */

    if (arr[i] < x) {
      fibM = fibMMm1;
      fibMMm1 = fibMMm2;
      fibMMm2 = fibM - fibMMm1;
      offset = i;
    }

    /* If x is greater than the value at index fibMmm2
     * cut the subarray array after i + 1.
     */
    else if (arr[i] > x) {
      fibM = fibMMm2;
      fibMMm1 = fibMMm1 - fibMMm2;
      fibMMm2 = fibM - fibMMm1;
    }

    //elwment found.Return index
    else {
      return i;
    }
  }

  //Comparing the last element with x
  if (arr[offset + 1] == x) {
    return offset + 1;
  }

  //element not found :(
  return -1;
}

void main() {
  //Get the array
  var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  var result;

  //Print the array
  print(arr);

  //The size of the array
  var n = arr.length;

  //Key to be searched in the array
  var key = 7;

  //Search the key using ternarySearch
  result = fibMaonaccianSearch(arr, key, n);

  //Print the result
  print("Index of " + key.toString() + " is " + result.toString());
}
