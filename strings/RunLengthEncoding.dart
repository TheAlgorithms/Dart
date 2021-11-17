// dart program to implement run length encoding
//reference : https://www.geeksforgeeks.org/run-length-encoding/

import 'package:test/test.dart';
String RunLengthEncoding(String str)
{
  int n = str.length;
  String res="";
  for (int i = 0; i < n; i++){
    // Count occurrences of current character
    int count = 1;
    while (i < n - 1 && str[i] == str[i + 1]) {
      count++;
      i++;
    }
    var s=str[i];
    res+=str[i];
    res+=count.toString();
  }
  return res;
}

int main()
{
  String str = "";
  var res = RunLengthEncoding(str);
  print("$res");
  test('test 1', () {
    str="aaaaa";
    expect(RunLengthEncoding(str),"a5");
  });

  test('test 2', () {
    str="aaaaabaaaaa";
    expect(RunLengthEncoding(str),"a5b1a5");
  });
  test('test 3', () {
    str="z";
    expect(RunLengthEncoding(str),"z1");
  });
  test('test 4', () {
    str="wwwwaaadexxxxxxywww";
    expect(RunLengthEncoding(str),"w4a3d1e1x6y1w3");
  });
  return 0;
}
