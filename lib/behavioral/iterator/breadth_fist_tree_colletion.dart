import 'package:pattern/behavioral/iterator/breadth_fist_iterator.dart';
import 'package:pattern/behavioral/iterator/graph.dart';
import 'package:pattern/behavioral/iterator/tree_colletion.dart';
import 'package:pattern/behavioral/iterator/tree_iterator.dart';

class BreadthFistTreeColletion implements ITreeColletion {
  const BreadthFistTreeColletion(this.graph);

  final Graph graph;
  @override
  ITreeIterator createIterator() => BreadthFistIterator(this);

  @override
  String geTitle() => 'Beadth-fist';
}
