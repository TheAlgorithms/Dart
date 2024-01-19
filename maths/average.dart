//Find mean of a list of numbers.

average(List numbers) {
  int sum = 0;
  for (int x in numbers) {
    sum += x;
  }
  var avg = sum / numbers.length;
  print(avg);
  return avg;
}

void main() {
  average([2, 8, 6, 90, 60]);
}
