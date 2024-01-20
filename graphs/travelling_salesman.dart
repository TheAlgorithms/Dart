import 'dart:math';

//defining point class to represent cities with(x,y) coordinates
class Point {
  final double x;
  final double y;
  Point(this.x, this.y);
  double distanceTo(Point other) {
    // returns the distance between the two points
    final dx = x - other.x;
    final dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

double calculateTotalDistance(List<Point> points, List<int> tour) {
  double totalDistance = 0.0;
  for (int i = 0; i < tour.length - 1; i++) {
    totalDistance += points[tour[i]].distanceTo(points[tour[i + 1]]);
  }
  totalDistance += points[tour.last].distanceTo(points[tour.last]);
  return totalDistance;
}

// Generate the next larger permutation of the list
bool nextPermutation(List<int> arr) {
  int i = arr.length - 2;
  while (i >= 0 && arr[i] > arr[i + 1]) {
    i--;
  }
  if (i == -1) {
    return false;
  }
  int j = arr.length - 1;
  while (arr[j] < arr[i]) {
    j--;
  }
  // swapping the values
  final temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;

  int left = i + 1;
  int right = arr.length - 1;
  while (left < right) {
    final temp = arr[left];
    arr[left] = arr[right];
    arr[right] = temp;
    left++;
    right--;
  }
  return true;
}

// TSP algo
List<int> TSP(List<Point> points) {
  final int numCities = points.length;

  final List<int> tour = List.generate(numCities, (i) => i);
  double minDistance = double.infinity;
  List<int> bestTour = [];
  do {
    final double tourDistance = calculateTotalDistance(points, tour);
    if (tourDistance < minDistance) {
      minDistance = tourDistance;
      bestTour = List.from(tour);
    }
  } while (nextPermutation(tour));
  return bestTour;
}

void main() {
  final List<Point> cities = [
    Point(0, 0),
    Point(1, 2),
    Point(2, 4),
    Point(3, 1),
    Point(4, 3)
  ];

  final List<int> shortestTour = TSP(cities);
  final String shortestDistance =
      calculateTotalDistance(cities, shortestTour).toStringAsPrecision(3);

  print('Shortest tour is :  $shortestTour');
  print('Shortest distance is : $shortestDistance');
}
