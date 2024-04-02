import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class ArrayStack<T> {
  /// [stack]
  List<T?> _stack = [];

  /// [_count] is the number of element in the stack
  int _count = 0;

  /// [_size] of stack
  int _size = 0;

  //Init the array stack
  ArrayStack(int size) {
    this._size = size;
    this._stack = List<T?>.filled(_size, null);
    this._count = 0;
  }

  /// Push a item to the stack of type [T] to the [_stack]
  /// if the size is exceeded the element wont be added.
  void push(T item) {
    if (_count == _size) {
      return null;
    }
    _stack[_count] = item;
    _count++;
  }

  /// Pop the last element inserted from the [_stack].
  T? pop() {
    if (_count == 0) {
      return null;
    }
    T? pop_data = _stack[_count - 1];
    _stack[_count - 1] = null;
    _count--;
    return pop_data;
  }

  List<T?> get stack {
    return _stack;
  }
}

void main() {
  ArrayStack<String> arrayStack = new ArrayStack<String>(6);

  arrayStack.push('1');
  arrayStack.push("2");
  arrayStack.push('3');
  arrayStack.push("4");
  arrayStack.push('5');
  arrayStack.push("6");

  test('test case 1', () {
    expect(arrayStack.stack, ['1', '2', '3', '4', '5', '6']);
  });

  test('test case 2: pop stack', () {
    expect('6', arrayStack.pop());
  });

  test('test case 3: pop stack', () {
    expect('5', arrayStack.pop());
  });

  test('test case 4: pop stack', () {
    expect('4', arrayStack.pop());
  });

  test('test case 5: pop stack', () {
    expect('3', arrayStack.pop());
  });

  test('test case 6: pop stack', () {
    expect('2', arrayStack.pop());
  });

  test('test case 7: pop stack', () {
    expect('1', arrayStack.pop());
  });

  test('test case 8: pop stack', () {
    expect(null, arrayStack.pop());
  });

  ArrayStack<String> arrayStack2 = new ArrayStack<String>(3);

  test('test case 9', () {
    expect(arrayStack2.stack, [null, null, null]);
  });
}
