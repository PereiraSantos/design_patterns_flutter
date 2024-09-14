import 'package:pattern/behavioral/iterator/depth_fist_iterator.dart';
import 'package:pattern/behavioral/iterator/graph.dart';
import 'package:pattern/behavioral/iterator/tree_colletion.dart';
import 'package:pattern/behavioral/iterator/tree_iterator.dart';

class DepthFistTreeColletion implements ITreeColletion {
  const DepthFistTreeColletion(this.graph);

  final Graph graph;
  @override
  ITreeIterator createIterator() => DepthFistIterator(this);

  @override
  String geTitle() => 'Depth-fist';
}
