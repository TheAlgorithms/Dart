/// Based on https://www.movable-type.co.uk/scripts/latlong.html
import "dart:math";

const double earthRadius = 6371;

/// Earth radius in kilometers

class Coordinates {
  double latitude;
  double longitude;

  Coordinates(this.latitude, this.longitude);
}

double haversine(fi) => pow(sin(fi / 2), 2).toDouble();

/// Convert [angle] to radians
double radians(double angle) => (angle * pi) / 180;

/// Calculate distance from [p1] to [p2] in kilometers
/// We assume that earth is perfect sphere (which is not true)
/// In practice you might expect ~1% errors
double distance(Coordinates p1, Coordinates p2) {
  double latitudeChange = radians(p2.latitude - p1.latitude);
  double latitude1 = radians(p1.latitude);
  double latitude2 = radians(p2.latitude);
  double longitudeChange = radians(p2.longitude - p1.longitude);

  double a = haversine(latitudeChange) +
      cos(latitude1) * cos(latitude2) * haversine(longitudeChange);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}

void main() {
  Coordinates newYork = new Coordinates(40.730610, -73.935242);
  Coordinates moskov = new Coordinates(55.751244, 37.618423);
  Coordinates toronto = new Coordinates(43.651070, -79.347015);
  Coordinates seoul = new Coordinates(37.532600, 127.024612);

  print("distance(newYork, moskov) = ${distance(newYork, moskov)}km");
  print("distance(newYork, toronto) = ${distance(newYork, toronto)}km");
  print("distance(seoul, moskov) = ${distance(seoul, moskov)}km");
  print("distance(moskov, seoul) = ${distance(moskov, seoul)}km");
}
