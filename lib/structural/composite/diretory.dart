import 'package:flutter/material.dart';
import 'package:pattern/structural/composite/file.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;

  final List<IFile> files = [];

  Directory(this.title, {super.key, this.isInitiallyExpanded = false});

  void addFile(IFile file) => files.add(file);

  @override
  Widget build(BuildContext context) => render(context);

  @override
  int getSize() {
    var sum = 0;

    for (final file in files) {
      sum += file.getSize();
    }
    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
          expansionTileTheme: Theme.of(context).expansionTileTheme.copyWith(iconColor: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ExpansionTile(
          title: Text('$title (${getSize()})'),
          initiallyExpanded: isInitiallyExpanded,
          children: files.map((IFile file) => file.render(context)).toList(),
        ),
      ),
    );
  }
}
