import 'package:flutter/material.dart';
import 'Util/HexToColor.dart';
import 'Util/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //     textTheme:
      //     const TextTheme(displayMedium: TextStyle(color: Colors.white)),
      //     brightness: Brightness.dark,
      //     useMaterial3: true,
      //     scaffoldBackgroundColor: HexColor("#010101"),
      //     elevatedButtonTheme: const ElevatedButtonThemeData(
      //         style: ButtonStyle(
      //             backgroundColor:
      //             MaterialStatePropertyAll(Color.fromARGB(100, 30, 30, 30)),
      //             shape: MaterialStatePropertyAll(CircleBorder())))),
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: HexColor("#F7F7F7")),
          textTheme:
              const TextTheme(displayMedium: TextStyle(color: Colors.black)),
          useMaterial3: true,
          scaffoldBackgroundColor: HexColor("#F7F7F7"),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(HexColor("#F9F9F9")),
                  shape: const MaterialStatePropertyAll(CircleBorder())))),
      title: 'HostelWise',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
