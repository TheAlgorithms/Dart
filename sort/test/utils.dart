bool isSorted(List<int> list) {
  if (list.length < 2) return true;

  int prev = list.first;
  for (var i = 1; i < list.length; i++) {
    int next = list[i];
    if (prev > next) return false;
    prev = next;
  }
  return true;
}
