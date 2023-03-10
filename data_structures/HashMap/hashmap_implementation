import 'package:test/test.dart';

// Internal class to store each key-value pair and its next node
class Entry<K, V> {
  final K key;
  V value;
  Entry<K, V> next;

  Entry(this.key, this.value, [this.next]);
}

class HashMap<K, V> {
  // Internal list to store the keys and values
  List<Entry<K, V>> _table;

  HashMap() {
    _table = List<Entry<K, V>>.filled(256, null);
  }

  // Helper function to generate a hash code for a key
  int _hashCode(K key) {
    return key.hashCode % _table.length;
  }

  // Insert a new key-value pair into the hash map
  void insert(K key, V value) {
    final int index = _hashCode(key);
    if (_table[index] == null) {
      _table[index] = Entry<K, V>(key, value);
    } else {
      Entry<K, V> entry = _table[index];
      while (entry.next != null && entry.key != key) {
        entry = entry.next;
      }
      if (entry.key == key) {
        entry.value = value;
      } else {
        entry.next = Entry<K, V>(key, value);
      }
    }
  }

  // Get the value associated with a key in the hash map
  V get(K key) {
    final int index = _hashCode(key);
    if (_table[index] == null) {
      return null;
    } else {
      Entry<K, V> entry = _table[index];
      while (entry != null && entry.key != key) {
        entry = entry.next;
      }
      return entry?.value;
    }
  }
}

void main() {
  test('adding a key to a map', () {
    HashMap map = HashMap();
    expect(map.get(1), null);
    map.insert(1, 'Akash');
    expect(map.get(1), 'Akash');
  });

  test('updating a key in a map', () {
    HashMap map = HashMap();
    map.insert(1, 'Akash');
    expect(map.get(1), 'Akash');
    map.insert(1, 'IronMan');
    expect(map.get(1), 'IronMan');
  });
}
