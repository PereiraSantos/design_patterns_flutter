import 'package:flutter/material.dart';
import 'package:pattern/behavioral/iterator/breadth_fist_tree_colletion.dart';
import 'package:pattern/behavioral/iterator/depth_fist_tree_colletion.dart';
import 'package:pattern/behavioral/iterator/graph.dart';
import 'package:pattern/behavioral/iterator/tree_colletion.dart';

class IteratorExemple extends StatefulWidget {
  const IteratorExemple({super.key});

  @override
  State<IteratorExemple> createState() => _IteratorExempleState();
}

class _IteratorExempleState extends State<IteratorExemple> {
  final List<ITreeColletion> treeColletion = [];

  var _selectTreeCollectionIndex = 0;
  int? _currentNodeIndex = 0;
  var _isTraversing = false;

  @override
  void initState() {
    super.initState();

    final graph = _buidGraph();

    treeColletion
      ..add(BreadthFistTreeColletion(graph))
      ..add(DepthFistTreeColletion(graph));
  }

  Graph _buidGraph() => Graph()
    ..addEdge(1, 2)
    ..addEdge(1, 3)
    ..addEdge(1, 4)
    ..addEdge(2, 5)
    ..addEdge(3, 6)
    ..addEdge(3, 7)
    ..addEdge(4, 8);

  void _setSelectTreeColletionIndex(int? index) {
    if (index == null) return;
    setState(() {
      _selectTreeCollectionIndex = index;
    });
  }

  Future<void> _traverseTree() async {
    _togglesTraversing();

    final iterator = treeColletion[_selectTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      if (!mounted) return;

      setState(() {
        _currentNodeIndex = iterator.getNext();
      });

      await Future.delayed(const Duration(seconds: 1));
    }

    _togglesTraversing();
  }

  void _togglesTraversing() => setState(() {
        _isTraversing = !_isTraversing;
      });

  void reset() => setState(() {
        _currentNodeIndex = 0;
      });

  Color _getBackgroundColor(int index) => _currentNodeIndex == index ? Colors.red[200]! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
