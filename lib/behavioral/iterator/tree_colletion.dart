import 'package:pattern/behavioral/iterator/tree_iterator.dart';

abstract interface class ITreeColletion {
  ITreeIterator createIterator();
  String geTitle();
}
