import "dart:math" show pow;

// Hexadecimal nuber to octal number conversion program
String hexadecimal_to_octal(String hex_val) {
  int dec = 0;
  int c = hex_val.length - 1;
  // finding the decimal equivalent of the hexa decimal number
  for (int i = 0; i < hex_val.length; i++) {
    //extracting each character from the string.
    var ch = hex_val.substring(i, i + 1);
    switch (ch) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        dec = dec + int.parse(ch) * pow(16, c);
        c--;
        break;
      case 'a':
      case 'A':
        dec = dec + 10 * pow(16, c);
        c--;
        break;
      case 'b':
      case 'B':
        dec = dec + 11 * pow(16, c);
        c--;
        break;
      case 'c':
      case 'C':
        dec = dec + 12 * pow(16, c);
        c--;
        break;
      case 'd':
      case 'D':
        dec = dec + 13 * pow(16, c);
        c--;
        break;
      case 'e':
      case 'E':
        dec = dec + 14 * pow(16, c);
        c--;
        break;
      case 'f':
      case 'F':
        dec = dec + 15 * pow(16, c);
        c--;
        break;
      default:
        print("Invalid hexa input");
        break;
    }
  }
  // String oct to store the octal equivalent of a hexadecimal number.
  String oct = "";

  //converting decimal to octal number.
  while (dec > 0) {
    oct = (dec % 8).toString() + oct;
    dec ~/ 8;
  }

  // Printing the final output.
  return ("Equivalent Octal Value = " + oct);
}

void main() {
  // taking 1AC as an example of hexadecimal Number.
  String hexa = "1AC";
  print(hexadecimal_to_octal(hexa));
}
