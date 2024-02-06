class AudioBookModel {
  final String title;
  final String avtor;
  final String speaker;
  final String date;
  final bool private;
  final String duration;
  final String size;
  final String audioFile;

  AudioBookModel({
    required this.title,
    required this.avtor,
    required this.speaker,
    required this.date,
    required this.private,
    required this.duration,
    required this.size,
    required this.audioFile,
  });
}