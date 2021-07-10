import 'package:test/test.dart';

bool Magic_no(var x) {
  var result = x % 9;
  return result == 1;
}

void main() {
  test("Test Magic_no returns false for non-magic numbers", () {
    expect(Magic_no(0), isFalse);
    expect(Magic_no(371), isFalse);
    expect(Magic_no(509), isFalse);
    expect(Magic_no(501), isFalse);
  });

  test("Test Magic_no returns true for magic numbers", () {
    expect(Magic_no(10), isTrue);
    expect(Magic_no(370), isTrue);
  });
}
