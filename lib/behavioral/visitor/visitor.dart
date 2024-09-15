import 'audio_file.dart';
import 'directory.dart';
import 'image_file.dart';
import 'text_file.dart';
import 'video_file.dart';

abstract interface class IVisitor {
  String getTitle();
  String visitDirectory(Directory directory);
  String visitAudioFile(AudioFile file);
  String visitImageFile(ImageFile file);
  String visitTextFile(TextFile file);
  String visitVideoFile(VideoFile file);
}
