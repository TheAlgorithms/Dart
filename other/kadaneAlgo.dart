// Program to find the Maximum contiguous sum (Kadane's Algorithm)
// Function to Calculate Maximum of Two Number
int max(int a, int b) {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

// Function to find the Maximum contiguous Sum in the array
int maxSubArraySum(List a, int size) {
  int maxSoFar = a[0];
  int currMax = a[0];

  for (int i = 1; i < size; i++) {
    currMax = max(a[i], currMax + a[i] as int);
    maxSoFar = max(maxSoFar, currMax);
  }
  return maxSoFar;
}

// main function for validation of the above
int main() {
  List a = [-2, -3, 4, -1, -2, 1, 5, -3];
  int n = a.length;
  int maxSum = maxSubArraySum(a, n);
  print('Maximum contiguous sum is $maxSum');
  return 0;
}
