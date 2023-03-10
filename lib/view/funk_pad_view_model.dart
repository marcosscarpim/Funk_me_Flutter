import 'package:flutter/material.dart';
import 'package:funk_me/source/funk_audio_data_source.dart';
import 'package:just_audio/just_audio.dart';
import 'package:funk_me/model/funk_audio.dart';

class FunkPadViewModel with ChangeNotifier {
  List<FunkAudio> _funkAudios = List.empty();

  List<FunkAudio> get funkAudios {
    return _funkAudios;
  }

  final List<AudioPlayer> players = List.generate(18, (index) {
    return AudioPlayer();
  });

  Future<void> prepare() async {
    _funkAudios = FunkAudioDataSource().getAudios();
    _funkAudios.forEach(loadPlayer);
    notifyListeners();
  }

  void loadPlayer(FunkAudio audio) {
    audio.audioPlayer.setAsset(audio.name);
  }

  void updateAudio(int index) {
    FunkAudio audio = _funkAudios[index];
    audio.isPlaying = !audio.isPlaying;
    if (audio.isPlaying) {
      if (audio.type == FunkType.repeat) {
        //audio.audioPlayer.setLoopMode(LoopMode.all);
        //audio.audioPlayer.play();
        sincRepeatableAudios();
      } else {
        audio.audioPlayer.playerStateStream.listen((playerState) {
          if (playerState.processingState == ProcessingState.completed) {
            audio.isPlaying = false;
            audio.audioPlayer.stop();
            audio.audioPlayer.seek(Duration.zero);
            notifyListeners();
          }
        });
        audio.audioPlayer.play();
      }
    } else {
      audio.audioPlayer.stop();
      audio.audioPlayer.seek(Duration.zero);
    }
    notifyListeners();
  }

  void sincRepeatableAudios() {
    var repeatAudios =
        _funkAudios.where((a) => a.type == FunkType.repeat && a.isPlaying);

    for (var a in repeatAudios) {
      if (a.audioPlayer.playing) {
        a.audioPlayer.stop();
        a.audioPlayer.seek(Duration.zero);
      }
    }

    for (var a in repeatAudios) {
      a.audioPlayer.setLoopMode(LoopMode.all);
      a.audioPlayer.play();
    }
  }
}
