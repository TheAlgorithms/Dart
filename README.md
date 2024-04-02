# The Algorithms - Dart

[![Build Status](https://travis-ci.com/TheAlgorithms/Dart.svg?branch=master)](https://travis-ci.com/TheAlgorithms/Dart)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/TheAlgorithms/100) &nbsp;
[![Discord chat](https://img.shields.io/discord/808045925556682782.svg?logo=discord&colorB=5865F2)](https://the-algorithms.com/discord/) &nbsp;
[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/#TheAlgorithms_community:gitter.im)

### All algorithms implemented in Dart (for education)

These implementations are for learning purposes. They may be less efficient than the implementations in the Dart standard library.

## List of Algorithms

See our [directory](https://github.com/TheAlgorithms/Dart/blob/master/DIRECTORY.md) for full list of all algorithms. A few of the algorithms (the most common ones) are explained here.

## Search Algorithms

### Linear
![alt text][linear-image]

From [Wikipedia][linear-wiki]: linear search or sequential search is a method for finding a target value within a list. It sequentially checks each element of the list for the target value until a match is found or until all the elements have been searched.
  Linear search runs in at the worst linear time and makes at most n comparisons, where n is the length of the list.

__Properties__
* Worst case performance    O(n)
* Best case performance    O(1)
* Average case performance    O(n)
* Worst case space complexity    O(1) iterative


### Binary
![alt text][binary-image]

From [Wikipedia][binary-wiki]: Binary search, also known as half-interval search or logarithmic search, is a search algorithm that finds the position of a target value within a sorted array. It compares the target value to the middle element of the array; if they are unequal, the half in which the target cannot lie is eliminated and the search continues on the remaining half until it is successful.

__Properties__
* Worst case performance    O(log n)
* Best case performance    O(1)
* Average case performance    O(log n)
* Worst case space complexity    O(1)

----------------------------------------------------------------------------------------------------------------------

## Sort Algorithms


### Bubble
![alt text][bubble-image]

From [Wikipedia][bubble-wiki]: Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted.

__Properties__
* Worst case performance    O(n^2)
* Best case performance    O(n)
* Average case performance    O(n^2)

###### View the algorithm in [action][bubble-toptal]



### Insertion
![alt text][insertion-image]

From [Wikipedia][insertion-wiki]: Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time. It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort.

__Properties__
* Worst case performance    O(n^2)
* Best case performance    O(n)
* Average case performance    O(n^2)

###### View the algorithm in [action][insertion-toptal]


### Quick
![alt text][quick-image]

From [Wikipedia][quick-wiki]: Quicksort (sometimes called partition-exchange sort) is an efficient sorting algorithm, serving as a systematic method for placing the elements of an array in order.

__Properties__
* Worst case performance    O(n^2)
* Best case performance    O(n log n) or O(n) with three-way partition
* Average case performance    O(n^2)

###### View the algorithm in [action][quick-toptal]

### Selection
![alt text][selection-image]

From [Wikipedia][selection-wiki]: The algorithm divides the input list into two parts: the sublist of items already sorted, which is built up from left to right at the front (left) of the list, and the sublist of items remaining to be sorted that occupy the rest of the list. Initially, the sorted sublist is empty and the unsorted sublist is the entire input list. The algorithm proceeds by finding the smallest (or largest, depending on sorting order) element in the unsorted sublist, exchanging (swapping) it with the leftmost unsorted element (putting it in sorted order), and moving the sublist boundaries one element to the right.

__Properties__
* Worst case performance    O(n^2)
* Best case performance    O(n^2)
* Average case performance    O(n^2)

###### View the algorithm in [action][selection-toptal]


### Merge
![alt text][merge-image]

From [Wikipedia][merge-wiki]: Merge sort (also commonly spelled mergesort) is a divide and conquer algorithm that was invented by John von Neumann in 1945. The algorithm dirst divides the list into the smallest unit (1 element), then compares each element with the adjacent list to sort and merge the two adjacent lists. Finally all the elements are sorted and merged. It is an efficient, general-purpose, comparison-based sorting algorithm.

__Properties__
* Worst case performance    O(n log n)
* Best case performance    O(n log n)
* Average case performance    O(n log n)

###### View the algorithm in [action][merge-toptal]


### Shell
![alt text][shell-image]

From [Wikipedia][shell-wiki]:  Shellsort is a generalization of insertion sort that allows the exchange of items that are far apart.  The idea is to arrange the list of elements so that, starting anywhere, considering every nth element gives a sorted list.  Such a list is said to be h-sorted.  Equivalently, it can be thought of as h interleaved lists, each individually sorted.

__Properties__
* Worst case performance O(nlog2 2n)
* Best case performance O(n log n)
* Average case performance depends on gap sequence

###### View the algorithm in [action][shell-toptal]

### Time-Complexity Graphs

Comparing the complexity of sorting algorithms (Bubble Sort, Insertion Sort, Selection Sort)

[Complexity Graphs](https://github.com/prateekiiest/Python/blob/master/sorts/sortinggraphs.png)

[bubble-toptal]: https://www.toptal.com/developers/sorting-algorithms/bubble-sort
[bubble-wiki]: https://en.wikipedia.org/wiki/Bubble_sort
[bubble-image]: https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Bubblesort-edited-color.svg/220px-Bubblesort-edited-color.svg.png "Bubble Sort"

[insertion-toptal]: https://www.toptal.com/developers/sorting-algorithms/insertion-sort
[insertion-wiki]: https://en.wikipedia.org/wiki/Insertion_sort
[insertion-image]: https://upload.wikimedia.org/wikipedia/commons/7/7e/Insertionsort-edited.png "Insertion Sort"

[quick-toptal]: https://www.toptal.com/developers/sorting-algorithms/quick-sort
[quick-wiki]: https://en.wikipedia.org/wiki/Quicksort
[quick-image]: https://upload.wikimedia.org/wikipedia/commons/6/6a/Sorting_quicksort_anim.gif "Quick Sort"

[merge-toptal]: https://www.toptal.com/developers/sorting-algorithms/merge-sort
[merge-wiki]: https://en.wikipedia.org/wiki/Merge_sort
[merge-image]: https://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif "Merge Sort"

[selection-toptal]: https://www.toptal.com/developers/sorting-algorithms/selection-sort
[selection-wiki]: https://en.wikipedia.org/wiki/Selection_sort
[selection-image]: https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Selection_sort_animation.gif/250px-Selection_sort_animation.gif "Selection Sort Sort"

[shell-toptal]: https://www.toptal.com/developers/sorting-algorithms/shell-sort
[shell-wiki]: https://en.wikipedia.org/wiki/Shellsort
[shell-image]: https://upload.wikimedia.org/wikipedia/commons/d/d8/Sorting_shellsort_anim.gif "Shell Sort"

[linear-wiki]: https://en.wikipedia.org/wiki/Linear_search
[linear-image]: http://www.tutorialspoint.com/data_structures_algorithms/images/linear_search.gif

[binary-wiki]: https://en.wikipedia.org/wiki/Binary_search_algorithm
[binary-image]: https://upload.wikimedia.org/wikipedia/commons/f/f7/Binary_search_into_array.png

----------------------------------------------------------------------------------

## Community Channel

We're on [Gitter](https://gitter.im/TheAlgorithms)! Please join us.

## Contribution

Please read our [CONTRIBUTING.md](https://github.com/TheAlgorithms/Dart/blob/master/CONTRIBUTING.md).

## License

[MIT](https://github.com/TheAlgorithms/Dart/blob/master/LICENSE)
