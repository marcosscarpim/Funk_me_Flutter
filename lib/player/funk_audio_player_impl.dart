import 'package:flutter/material.dart';
import 'package:funk_me/model/funk_audio.dart';
import 'package:funk_me/player/funk_audio_player.dart';
import 'package:just_audio/just_audio.dart';

import '../source/funk_audio_data_source.dart';

class FunkAudioPlayerImpl implements FunkAudioPlayer {
  final List<FunkAudio> _funkAudios = FunkAudioDataSource().getAudios();

  @override
  List<FunkAudio> get funkAudios => _funkAudios;

  @override
  List<FunkAudio> loadAudios() {
    _funkAudios.forEach(_loadPlayer);
    return funkAudios;
  }

  @override
  void updateAudio(int index, VoidCallback callback) {
    FunkAudio audio = _funkAudios[index];
    audio.isPlaying = !audio.isPlaying;
    if (audio.isPlaying) {
      if (audio.type == FunkType.repeat) {
        sincRepeatableAudios(index);
      } else {
        audio.audioPlayer.play();
        addListener(audio, callback);
      }
    } else {
      audio.audioPlayer.stop();
      audio.audioPlayer.seek(Duration.zero);
    }
  }

  void addListener(FunkAudio audio, VoidCallback callback) {
    audio.audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        audio.isPlaying = false;
        audio.audioPlayer.stop();
        audio.audioPlayer.seek(Duration.zero);
        callback();
      }
    });
  }

  void _loadPlayer(FunkAudio audio) {
    audio.audioPlayer.setAsset(audio.name);
  }

  void sincRepeatableAudios(int newIndex) {
    var repeatAudios =
        _funkAudios.where((a) => a.type == FunkType.repeat && a.isPlaying);

    for (var a in repeatAudios) {
      if (a.id != newIndex) {
        a.audioPlayer.pause();
        a.audioPlayer.seek(Duration.zero);
      }
    }

    for (var a in repeatAudios) {
      a.audioPlayer.setLoopMode(LoopMode.all);
      a.audioPlayer.play();
    }
  }
}
