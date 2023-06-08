import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flashie/flashie.dart';
import 'package:flashie/google_banner_ad.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashie',
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 48, 48, 48),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Color.fromARGB(255, 127, 127, 127);
              } else {
                return Colors.blue;
              }
            }),
            foregroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 48, 48, 48)),
            fixedSize: MaterialStateProperty.all(const Size(200.0, 150.0)),
            iconSize: MaterialStateProperty.all(90.0),
            elevation: MaterialStateProperty.all(.5),
          ),
        ),
        sliderTheme: const SliderThemeData(
          trackHeight: 10.0,
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 249, 249, 249),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(200.0, 150.0)),
            iconSize: MaterialStateProperty.all(90.0),
            elevation: MaterialStateProperty.all(.5),
          ),
        ),
        sliderTheme: const SliderThemeData(
          trackHeight: 10.0,
        ),
      ),
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'FLASHIE',
              style: GoogleFonts.chewy(
                textStyle: const TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        body: const Flashie(),
        bottomNavigationBar: const Row(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: GoogleBannerAd(),
            )
          ],
        ),
      ),
    );
  }
}
