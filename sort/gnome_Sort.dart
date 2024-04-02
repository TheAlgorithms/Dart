// Sorting of array using gnome sort
//Author:Shawn
//Email:stepfencurryxiao@gmail.com

//Function sort the array using gnome sort
void gnomeSort(List arr, var n) {
  if (arr.isEmpty || n == 0) return;
  int first = 1;
  int second = 2;

  while (first < n) {
    if (arr[first - 1] <= arr[first]) {
      first = second;
      second++;
    } else {
      int temp = arr[first - 1];
      arr[first - 1] = arr[first];
      arr[first] = temp;
      first -= 1;
      if (first == 0) {
        first = 1;
        second = 2;
      }
    }
  }
}

void main() {
  //Get the array
  List arr = [10, 34, 6, 323, 7];

  //Get size of the array
  int n = arr.length;

  //print the array
  print(arr);

  //Sorting of array using gnome sort
  gnomeSort(arr, n);

  //print the result
  print("Sorted:\n" + arr.toString());
}
