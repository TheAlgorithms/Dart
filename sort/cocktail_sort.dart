void cocktailSort(List lst) //function to sort a list
{
  bool swapDone = true;
  do {
    swapDone = false;
    for (int i = 0; i < lst.length - 2; i++) {
      swapDone = swapItemCocktail(lst, i, swapDone);
    }

    if (swapDone) {
      swapDone = false;
      for (int i = lst.length - 2; i >= 0; i--) {
        swapDone = swapItemCocktail(lst, i, swapDone);
      }
    }
  } while (swapDone);
}

bool swapItemCocktail(List lst, int i, bool swapDone) {
  if (lst[i] > lst[i + 1]) {
    swap(lst, i);
    swapDone = true;
  }
  return swapDone;
}

void swap(List lst, int i) {
  int tmp = lst[i];
  lst[i] = lst[i + 1];
  lst[i + 1] = tmp;
}

void main() //driver function
{
  var lst = [5, 3, 6, 7, 3, 378, 3, 1, -1];
  print(lst);
  cocktailSort(lst);
  print(lst);
}
