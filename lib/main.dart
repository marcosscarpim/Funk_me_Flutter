import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funk_me/locator.dart';
import 'package:funk_me/player/funk_audio_player.dart';
import 'package:funk_me/view/funk_pad_view_model.dart';
import 'package:provider/provider.dart';
import 'package:funk_me/view/funk_pad.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FunkPadViewModel(locator<FunkAudioPlayer>()),
        ),
      ],
      child: MaterialApp(
        title: 'Funk Me',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FunkPad(),
        },
      ),
    );
  }
}
