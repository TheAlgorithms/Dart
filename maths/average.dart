//Find mean of a list of numbers.

average(List numbers) {
  var sum = 0;
  for (var x in numbers) {
    sum += x;
  }
  var avg = sum / numbers.length;
  print(avg);
  return avg;
}

void main() {
  average([2, 8, 6, 90, 60]);
}
