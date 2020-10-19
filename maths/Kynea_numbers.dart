// CPP code to find nth Kynea number

//#include <bits/stdc++.h>
//using namespace std;

// Function to calculate nth kynea number
int nthKyneaNumber(int n) {
  // Calculate nth kynea number
  // using formula ((2^n + 1)^2 ) -2

  // Firstly calculate 2^n + 1
  n = (1 << n) + 1;

  // Now calculate (2^n + 1)^2
  n = n * n;

  // Now calculate ((2^n + 1)^2 ) - 2
  n = n - 2;

  // return nth Kynea number
  return n;
}

// Driver Program
int main() {
  int n = 8;

  // print nth kynea number
  print(nthKyneaNumber(n));

  return 0;
}
/*void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
}*/
