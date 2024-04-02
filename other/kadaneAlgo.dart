// Program to find the Maximum contiguous sum (Kadane's Algorithm)
// Function to Calculate Maximum of Two Number
int max(int a, int b) {
  if (a > b)
    return a;
  else
    return b;
}

// Function to find the Maximum contiguous Sum in the array
int maxSubArraySum(List<int> a, int size) {
  int max_so_far = a[0];
  int curr_max = a[0];

  for (int i = 1; i < size; i++) {
    curr_max = max(a[i], curr_max + a[i]);
    max_so_far = max(max_so_far, curr_max);
  }
  return max_so_far;
}

// main function for validation of the above
int main() {
  List<int> a = [-2, -3, 4, -1, -2, 1, 5, -3];
  int n = a.length;
  int max_sum = maxSubArraySum(a, n);
  print("Maximum contiguous sum is " + max_sum.toString());
  return 0;
}
