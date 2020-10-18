var arr = new List<bool>.filled(1001, true, growable: false);
void simple_seive() {
  for (int p = 2; p * p < 1001; p++) {
    if (arr[p] == true) {
      for (int i = p * 2; i < 1001; i = i + p) arr[i] = false;
    }
  }
}

bool sphenic_number(int N) {
  var arr1 = new List<int>.filled(9, 0, growable: false);

  var count = 0;
  var j = 0;

  for (int i = 1; i <= N; i++) {
    if (N % i == 0 && count < 9) {
      count++;
      arr1[j] = i;
      j++;
    }
  }

  if (count == 8 &&
      (arr[arr1[0]] == true && arr[arr1[1]] == true && arr[arr1[2]] == true))
    return true;
  return false;
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
