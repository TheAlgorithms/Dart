// The Hamming distance between two strings of equal length is
// the number of positions at which the corresponding symbols are different.
// https://en.wikipedia.org/wiki/Hamming_distance

int hamming_distance(String stringA, String stringB) {
  //Calculates Hamming Distance
  int distance;

  //strings must be of equal length
  if (stringA.length != stringB.length) {
    print('String lengths must be same!');
    return 0;
  } else {
    distance = 0;
    for (var i = 0; i < stringA.length; i++) {
      if (stringA[i] != stringB[i]) {
        distance += 1;
      }
    }
  }
  return distance;
}

void main() {
  String stringA;
  String stringB;
  int dist;

  stringA = 'karolin';
  stringB = 'kathrin';
  dist = hamming_distance(stringA, stringB);
  print('Hamming Distance between $stringA and $stringB is $dist');

  stringA = '1011101';
  stringB = '1001001';
  dist = hamming_distance(stringA, stringB);
  print('Hamming Distance between $stringA and $stringB is $dist');
}
