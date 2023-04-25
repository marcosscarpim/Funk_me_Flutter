import 'package:funk_me/model/funk_audio.dart';
import 'package:just_audio/just_audio.dart';

class FunkAudioDataSource {
  List<FunkAudio> getAudios() {
    var audioList = <FunkAudio>[];
    audioList.add(
      FunkAudio(
        id: 0,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/beat_mix.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 1,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/eletronico.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 2,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/palma_hu.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 3,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/pum_bum.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 4,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/ah_vai_ok.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 5,
        type: FunkType.repeat,
        duration: 0,
        isPlaying: false,
        name: "audios/padrao_ok.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 6,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/virada.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 7,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/boomber.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 8,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/gaitinha.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 9,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/grana.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 10,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/ohh.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 11,
        type: FunkType.sound,
        duration: 0,
        isPlaying: false,
        name: "audios/sax.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 12,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/gemido.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 13,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/ah_que_delicia.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 14,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/sarra_ah.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 15,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/safadinha.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 16,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/vai_sentando.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    audioList.add(
      FunkAudio(
        id: 17,
        type: FunkType.voice,
        duration: 0,
        isPlaying: false,
        name: "audios/vem_sentando.mp3",
        audioPlayer: AudioPlayer(),
      ),
    );
    return audioList;
  }
}
