import 'package:flutter/material.dart';
import 'package:pattern/structural/composite/audio_file.dart';
import 'package:pattern/structural/composite/diretory.dart';

class CompositeExample extends StatelessWidget {
  const CompositeExample({super.key});

  Widget _buildMediaDiretory() {
    final musicDirectory = Directory('Music')
      ..addFile(const AudioFile(title: 'Darude - Sandstom', size: 233333))
      ..addFile(const AudioFile(title: 'Toto - Africa.mp3', size: 05959))
      ..addFile(const AudioFile(title: 'Bag Raiders', size: 8488));

    final moviesDirectory = Directory('Movies')
      ..addFile(const AudioFile(title: 'The Matrix avi', size: 089348487))
      ..addFile(const AudioFile(title: 'The matrix reloaded mp4', size: 02635));

    final catsDirectory = Directory('cats')
      ..addFile(const VideoFile(title: 'Cat 1', size: 089348487))
      ..addFile(const VideoFile(title: 'Cat 2', size: 02635))
      ..addFile(const VideoFile(title: 'Cat 3 ', size: 02635));

    final picturesDirectory = Directory('Picture')
      ..addFile(catsDirectory)
      ..addFile(const ImageFile(title: 'The matrix reloaded mp4', size: 02635));

    final mediaDirectoy = Directory('Media')
      ..addFile(musicDirectory)
      ..addFile(musicDirectory)
      ..addFile(moviesDirectory)
      ..addFile(picturesDirectory)
      ..addFile(Directory('New Folder'))
      ..addFile(const TextFile(title: 'Nothing supicius.txt', size: 430791))
      ..addFile(const TextFile(title: 'TeamTrees.txt', size: 104));

    return mediaDirectoy;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composite'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: _buildMediaDiretory(),
      ),
    );
  }
}
