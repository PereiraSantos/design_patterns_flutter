import 'dart:collection';

import 'package:pattern/behavioral/iterator/breadth_fist_tree_colletion.dart';
import 'package:pattern/behavioral/iterator/tree_iterator.dart';

class BreadthFistIterator implements ITreeIterator {
  BreadthFistIterator(this.treeColletion) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }

  final BreadthFistTreeColletion treeColletion;
  final Set<int> visitedNodes = <int>{};
  final ListQueue<int> nodeStack = ListQueue<int>();

  final _initialNode = 1;
  late int _currentNode;

  Map<int, Set<int>> get adjacencyList => treeColletion.graph.adjacenyList;

  @override
  int? getNext() {
    if (!hasNext()) return null;

    _currentNode = nodeStack.removeLast();
    visitedNodes.add(_currentNode);

    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode]!.where((n) => !visitedNodes.contains(n))) {
        nodeStack.addLast(node);
      }
    }

    return _currentNode;
  }

  @override
  bool hasNext() => nodeStack.isEmpty;

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeStack.clear();
    nodeStack.add(_initialNode);
  }
}
