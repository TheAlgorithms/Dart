//find the min number
find_min(List numbers) {
  var min = numbers[0];
  for (var x in numbers) {
    if (min > x) {
      min = x;
    }
  }
  print(min);
}

void main() {
  find_min([2, 9, 18, 8, 76, -3]);
}
