/**
 * Reverse String
 */

void main() {
  String stringToReverse = "The Algorithms:Dart";
  print('Method 1 =>  $stringToReverse\t   ${reverseString(stringToReverse)}');
  print('Method 2 =>  $stringToReverse\t   ${reverseString2(stringToReverse)}');
}

/**
 * * easiest way to reverses the string
 */
String reverseString(String str) {
  return str.split('').reversed.join();
}

/**
 * Second way to reverses the string
 */
String reverseString2(String str) {
  String reversed = "";
  for (int i = str.length - 1; i >= 0; i--) reversed += str[i];
  return reversed;
}
