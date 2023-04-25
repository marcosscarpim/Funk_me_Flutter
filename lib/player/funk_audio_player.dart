import 'package:flutter/material.dart';
import 'package:funk_me/model/funk_audio.dart';

abstract class FunkAudioPlayer {
  List<FunkAudio> get funkAudios;

  List<FunkAudio> loadAudios();

  /*
   * Update Audio.
   * 
   * Callback is called when audio state changes.
   */
  void updateAudio(int index, VoidCallback callback);
}
