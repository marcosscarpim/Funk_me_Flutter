import 'package:just_audio/just_audio.dart';

enum FunkType { repeat, sound, voice }

class FunkAudio {
  final int id;
  final FunkType type;
  final int duration;
  bool isPlaying;
  final String name;
  final AudioPlayer audioPlayer;

  FunkAudio({
    required this.id,
    required this.type,
    required this.duration,
    required this.isPlaying,
    required this.name,
    required this.audioPlayer,
  });
}
