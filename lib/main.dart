import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funk_me/view/funk_pad_view_model.dart';
import 'package:provider/provider.dart';
import 'package:funk_me/view/funk_pad.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        ChangeNotifierProvider.value(value: FunkPadViewModel()),
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
