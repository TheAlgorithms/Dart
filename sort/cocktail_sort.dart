void cocktailSort(List lst) //function to sort a list
{
  bool swap_done = true;
  do {
    swap_done = false;
    for (int i = 0; i < lst.length - 2; i++) {
      swap_done = swapItemCocktail(lst, i, swap_done);
    }

    if (swap_done) {
      swap_done = false;
      for (int i = lst.length - 2; i >= 0; i--) {
        swap_done = swapItemCocktail(lst, i, swap_done);
      }
    }
  } while (swap_done);
}

bool swapItemCocktail(List lst, int i, bool swap_done) {
  if (lst[i] > lst[i + 1]) {
    swap(lst, i);
    swap_done = true;
  }
  return swap_done;
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
