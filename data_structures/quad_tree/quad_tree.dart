// Author: Jerold Albertson
// Profile: https://github.com/jerold
// Algorithm: https://en.wikipedia.org/wiki/Quadtree

import 'dart:math';
import 'package:test/test.dart';

// defaults should almost never be used, tune the quad tree to fit your problem
int default_max_depth = 1000;
int default_max_items = 100;

// names reflect a coordinate system where values increase as one goes left or down
const _upperLeftIndex = 0;
const _upperRightIndex = 1;
const _lowerLeftIndex = 2;
const _lowerRightIndex = 3;

class Node<T> extends Rectangle<num> {
  final int maxDepth;
  final int maxItems;

  final int _depth;
  final Point<num> _center;
  final List<_ItemAtPoint<T>> _items = <_ItemAtPoint<T>>[];
  final List<Node<T>> _children = <Node<T>>[];

  factory Node(num left, num top, num width, num height,
          {int maxDepth, int maxItems}) =>
      Node._(left, top, width, height, maxDepth, maxItems, 0);

  Node._(num left, num top, num width, num height, int maxDepth, int maxItems,
      int depth)
      : maxDepth = maxDepth ?? default_max_depth,
        maxItems = maxItems ?? default_max_items,
        _depth = depth,
        _center = Point<num>(left + width / 2.0, top + height / 2.0),
        super(left, top, width, height);

  bool insert(T item, Point<num> atPoint) {
    if (!containsPoint(atPoint)) return false;

    if (_children.isEmpty) {
      if (_items.length + 1 <= maxItems || _depth + 1 > maxDepth) {
        _items.add(_ItemAtPoint<T>(item, atPoint));
        return true;
      }
      _splitItemsBetweenChildren();
    }
    return _insertItemIntoChildren(item, atPoint);
  }

  List<T> query(Rectangle range) {
    if (_children.isEmpty) {
      return _items
          .where((item) => range.containsPoint(item.point))
          .map((item) => item.item)
          .toList();
    }
    return _children
        .where((child) => child.intersects(range))
        .expand((child) => child.query(range))
        .toList();
  }

  String toString() {
    return '[$_depth](${_items.map((item) => item.item).toList()}:$_children)';
  }

  bool _insertItemIntoChildren(T item, Point<num> atPoint) {
    if (atPoint.x > _center.x) {
      if (atPoint.y > _center.y) {
        return _children[_lowerRightIndex].insert(item, atPoint);
      }
      return _children[_upperRightIndex].insert(item, atPoint);
    } else {
      if (atPoint.y > _center.y) {
        return _children[_lowerLeftIndex].insert(item, atPoint);
      } else {
        return _children[_upperLeftIndex].insert(item, atPoint);
      }
    }
  }

  void _splitItemsBetweenChildren() {
    _children.addAll([
      _newUpperLeft, // _upperLeftIndex = 0
      _newUpperRight, // _upperRightIndex = 1
      _newLowerLeft, // _lowerLeftIndex = 2
      _newLowerRight // _lowerRightIndex = 3
    ]);
    for (final item in _items) {
      _insertItemIntoChildren(item.item, item.point);
    }
    _items.clear();
  }

  Node<T> get _newUpperLeft => Node<T>._(
      left, top, width / 2.0, height / 2.0, maxDepth, maxItems, _depth + 1);

  Node<T> get _newUpperRight => Node<T>._(_center.x, top, width / 2.0,
      height / 2.0, maxDepth, maxItems, _depth + 1);

  Node<T> get _newLowerLeft => Node<T>._(left, _center.y, width / 2.0,
      height / 2.0, maxDepth, maxItems, _depth + 1);

  Node<T> get _newLowerRight => Node<T>._(_center.x, _center.y, width / 2.0,
      height / 2.0, maxDepth, maxItems, _depth + 1);
}

class _ItemAtPoint<T> {
  final T item;
  final Point<num> point;

  _ItemAtPoint(this.item, this.point);
}

void main() {
  group('QuadTree', () {
    test('items will not insert at points outside the tree\'s bounds', () {
      final tree = Node<String>(-50, -50, 100, 100);
      expect(tree.insert("a", Point(-75, 0)), isFalse);
      expect(tree.insert("b", Point(75, 0)), isFalse);
      expect(tree.insert("c", Point(0, -75)), isFalse);
      expect(tree.insert("d", Point(0, 75)), isFalse);
      expect(tree.toString(), equals("[0]([]:[])"));
    });

    test('maxItems is honored until maxDepth is hit', () {
      final tree = Node<String>(0, 0, 100, 100, maxItems: 2, maxDepth: 2);

      expect(tree.insert("a", Point(0, 0)), isTrue);
      expect(tree.toString(), equals("[0]([a]:[])"));

      expect(tree.insert("b", Point(100, 0)), isTrue);
      expect(tree.toString(), equals("[0]([a, b]:[])"));

      expect(tree.insert("c", Point(0, 100)), isTrue);
      expect(
          tree.toString(),
          equals(
              "[0]([]:[[1]([a]:[]), [1]([b]:[]), [1]([c]:[]), [1]([]:[])])"));

      expect(tree.insert("d", Point(100, 100)), isTrue);
      expect(
          tree.toString(),
          equals(
              "[0]([]:[[1]([a]:[]), [1]([b]:[]), [1]([c]:[]), [1]([d]:[])])"));

      expect(tree.insert("e", Point(99, 99)), isTrue);
      expect(tree.insert("f", Point(99, 99)), isTrue);
      expect(tree.insert("g", Point(99, 99)), isTrue);
      expect(tree.insert("h", Point(99, 99)), isTrue);
      expect(
          tree.toString(),
          equals(
              "[0]([]:[[1]([a]:[]), [1]([b]:[]), [1]([c]:[]), [1]([]:[[2]([]:[]), [2]([]:[]), [2]([]:[]), [2]([d, e, f, g, h]:[])])])"));
    });

    test(
        'better at finding local points within a large space than simple iteration',
        () {
      final rand = Random.secure();
      final items = <int, Point>{};

      final width = 1000;
      final height = 1000;

      var timesBetter = 0;
      final numberOfRuns = 100;
      // run the same test x number of times
      for (int j = 0; j < numberOfRuns; j++) {
        // test consists of setting up x items, distributing them randomly
        // within a space, and then searching for a small subset of those
        // using simple rect comparison on all items, or a quad tree query
        final tree = Node(0, 0, width, height);
        final numberOfItems = 50000;
        for (int i = 0; i < numberOfItems; i++) {
          items[i] =
              Point(rand.nextDouble() * width, rand.nextDouble() * height);
          expect(tree.insert(i, items[i]), isTrue);
        }

        // set up a box that is 1/10th the size of the total space
        final rangeSizePercentage = .1;
        final rangeWidth = width * rangeSizePercentage;
        final rangeHeight = height * rangeSizePercentage;
        final rangeLeft = rand.nextDouble() * (width - rangeWidth);
        final rangeTop = rand.nextDouble() * (height - rangeHeight);

        final range = Rectangle(rangeLeft, rangeTop, rangeWidth, rangeHeight);

        // simple iteration over all items, comparing each to the given range
        var startTime = DateTime.now();
        final foundA =
            items.keys.where((key) => range.containsPoint(items[key])).toList();
        var iterationTime = DateTime.now().difference(startTime);

        // quad tree query rules out whole quadrants full of points when possible
        startTime = DateTime.now();
        final foundB = tree.query(range);
        var quadTreeTime = DateTime.now().difference(startTime);

        if (iterationTime.compareTo(quadTreeTime) > 0) {
          timesBetter++;
        }

        // every time, quad tree query results should equal brute force results
        expect(foundA.toSet().containsAll(foundB), isTrue,
            reason: "not all items were found");
        expect(foundB.toSet().containsAll(foundA), isTrue,
            reason: "not all items were found");
      }

      expect(timesBetter / numberOfRuns > 0.5, isTrue,
          reason:
              "tree query was only better ${timesBetter / numberOfRuns * 100}% of the time");
    });
  });
}
