/// Swap given [index1] and [index2] in given [collection]
void swap<T>(List<T> collection, int index1, int index2) {
  T temp = collection[index1];
  collection[index1] = collection[index2];
  collection[index2] = temp;
}

/// Returns all permutations of given [collection]
List<List<T>> permutations<T>(List<T> collection) {
  List<int> stack = List.generate(collection.length, (x) => 0);

  List<T> currentPermutation = List.from(collection);
  List<List<T>> output = [collection];

  int i = 0;
  while (i < collection.length) {
    if (stack[i] < i) {
      if (i % 2 == 0) {
        swap(currentPermutation, 0, i);
      } else {
        swap(currentPermutation, stack[i], i);
      }
      output.add(List.from(currentPermutation));
      stack[i]++;
      i = 0;
    } else {
      stack[i] = 0;
      i++;
    }
  }
  return output;
}

main() {
  print(permutations([]));
  print(permutations([1, 2]));
  print(permutations([1, 2, 3]));

  print("3! = ${permutations([1, 2, 3]).length}");
  print("4! = ${permutations([1, 2, 3, 4]).length}");
  print("5! = ${permutations([1, 2, 3, 4, 5]).length}");
  print("6! = ${permutations([1, 2, 3, 4, 5, 6]).length}");
}
