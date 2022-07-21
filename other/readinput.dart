// function to read data from the console easily..
// just import this file to your file...
import 'dart:io';
dynamic readFunc(datatype) {
  String? _input = stdin.readLineSync();
  if (_input != null) {
    switch (datatype) {
      case int:
        int result = int.parse(_input);
        return result;
      case double:
        double result = double.parse(_input);
        return result;
      case String:
        String result = _input;
        return result;
      default:
        break;
    }
  }
}
 /*
 example:
 int a = readFunc(int);  // let's say user enters 26
 print(a)  // 26
 
 String name = readFunc(String);
 // "athar"
 print(name);  // athar
 */
