import 'package:funk_me/player/funk_audio_player.dart';
import 'package:funk_me/player/funk_audio_player_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<FunkAudioPlayer>(FunkAudioPlayerImpl());
}
