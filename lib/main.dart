import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flashie/flashie.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

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
          //7f7f7f
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
            fixedSize: MaterialStateProperty.all(const Size(250.0, 150.0)),
            iconSize: MaterialStateProperty.all(90.0),
            padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
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
            fixedSize: MaterialStateProperty.all(const Size(250.0, 150.0)),
            iconSize: MaterialStateProperty.all(90.0),
            padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            elevation: MaterialStateProperty.all(.5),
          ),
        ),
        sliderTheme: const SliderThemeData(
          trackHeight: 10.0,
        ),
      ),
      themeMode: ThemeMode.system,
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
      ),
    );
  }
}
