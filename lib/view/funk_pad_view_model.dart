import 'package:flutter/material.dart';
import 'package:funk_me/player/funk_audio_player_impl.dart';
import 'package:funk_me/model/funk_audio.dart';

class FunkPadViewModel with ChangeNotifier {
  final FunkAudioPlayerImpl _audioPlayer = FunkAudioPlayerImpl();

  List<FunkAudio> _funkAudios = List.empty();

  List<FunkAudio> get funkAudios {
    return _funkAudios;
  }

  Future<void> prepare() async {
    _funkAudios = _audioPlayer.loadAudios();
    notifyListeners();
  }

  void updateAudio(int index) {
    _audioPlayer.updateAudio(index, () {
      notifyListeners();
    });
    notifyListeners();
  }
}
