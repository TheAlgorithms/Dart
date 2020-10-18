var arr = new List<int>.filled(1001, 1, growable: false);
void simple_seive() {
  for (int p = 2; p * p < 1001; p++) {
    if (arr[p] == 1) {
      for (int i = p * 2; i < 1001; i = i + p) arr[i] = 0;
    }
  }
}

int sphenic_number(int N) {
  var arr1 = new List<int>.filled(9, 0, growable: false);
  var i;

  var count;
  var j;
  count = 0;
  j = 0;

  for (i = 1; i <= N; i++) {
    if (N % i == 0 && count < 9) {
      count++;
      arr1[j] = i;
      j++;
    }
  }

  if (count == 8 &&
      (arr[arr1[0]] == 1 && arr[arr1[1]] == 1 && arr[arr1[2]] == 1)) return 1;
  return 0;
}

void main() {
  simple_seive();
  var ans;
  ans = sphenic_number(30);
  print(ans);
  ans = sphenic_number(60);
  print(ans);
  ans = sphenic_number(70);
  print(ans);
  ans = sphenic_number(101);
  print(ans);
  ans = sphenic_number(130);
  print(ans);
  ans = sphenic_number(240);
  print(ans);
}
