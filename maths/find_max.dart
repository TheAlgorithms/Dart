//find the max number
find_max(List numbers) {
  var max = numbers[0];
  for (var x in numbers) {
    if (x > max) {
      max = x;
    }
  }
  print(max);
}

void main() {
  find_max([2, 9, 18, 8, 76, -3]);
}
