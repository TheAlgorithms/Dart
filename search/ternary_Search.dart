//Title:Ternary Search
//Author:Shawn
//Email:stepfencurryxiao@gmail.com

int ternarySearch(var l, var r, var key, var arr) {
  if (r >= 1) {
    //Find the mid1 and mid2
    var mid1 = (l + (r - l) / 3).toInt();
    var mid2 = (r - (r - 1) / 3).toInt();

    //Check if key is present at any mid
    if (arr[mid1] == key) return mid1;

    if (arr[mid2] == key) return mid2;

    /*Since Key is not present at mid
     * check in which region it is present
     * then repeat the Search operation
     * in that region
     */

    if (key < arr[mid1]) {
      //The Key lies in between 1 and mid1
      return ternarySearch(l, mid1 - 1, key, arr);
    } else if (key > arr[mid2]) {
      //The key lies in between mid2 and r
      return ternarySearch(mid2 + 1, r, key, arr);
    } else {
      //The key lies in between mid1 and mid2
      return ternarySearch(mid1 + 1, mid2 - 1, key, arr);
    }
  }

  //Key not found
  return -1;
}

//Driver code
void main() {
  var l, r, p, key;

  //Get the array
  var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  //Print the array
  print(arr);

  //Starting index
  l = 0;

  // length of array
  r = arr.length;

  //Checking for 5
  //Key to be searched in the array
  key = 5;

  //Search the key using ternarySearch
  p = ternarySearch(l, r, key, arr);

  //Print the result
  print("Index of " + key.toString() + " is " + p.toString());
}
