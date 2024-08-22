import 'package:flutter/material.dart';

abstract interface class IFile {
  int getSize();
  Widget render(BuildContext context);
}

base class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;

  const File({super.key, required this.title, required this.size, required this.icon});

  @override
  Widget build(BuildContext context) => render(context);

  @override
  int getSize() => size;

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black54),
        ),
        leading: Icon(icon),
        trailing: Text(
          size.toString(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        dense: true,
      ),
    );
  }
}
