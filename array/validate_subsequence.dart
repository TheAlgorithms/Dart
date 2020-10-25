import 'package:test/test.dart';

bool checkIsSubSequence(List<int> array, List<int> sequence) {
  if (array.isEmpty) {
    return false;
  }

  if (sequence.isEmpty) {
    return true;
  }
  int arrayIndex = 0;
  int sequenceIndex = 0;

  while (sequenceIndex < sequence.length && arrayIndex < array.length) {
    if (sequence[sequenceIndex] == array[arrayIndex]) {
      sequenceIndex += 1;
    }
    arrayIndex += 1;
  }
  return sequenceIndex == sequence.length;
}

void main() {
  List<int> array;
  List<int> sequence;

  test('test 1', () {
    array = [5, 1, 22, 25, 6, -1, 8, 10];
    sequence = [1, 6, -1, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 2', () {
    array = [5, 1, 22, 25, 6, -1, 8, 10];
    sequence = [5, -1, 8, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 3', () {
    array = [1, 1, 1, 1, 1];
    sequence = [0, 0, 0, 0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 4', () {
    array = [1, 6, -1, 10];
    sequence = [1, 6, -1, 10];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });

  test('test 5', () {
    array = [1, 1, 6, 1];
    sequence = [0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 6', () {
    array = [];
    sequence = [0];
    expect(checkIsSubSequence(array, sequence), isFalse);
  });

  test('test 7', () {
    array = [1, 1, 6, 1];
    sequence = [];
    expect(checkIsSubSequence(array, sequence), isTrue);
  });
}
