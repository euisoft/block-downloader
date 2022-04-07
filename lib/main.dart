import 'package:block_downloader/styles/theme.dart';
import 'package:block_downloader/widgets/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Block Downloader',
      theme: createTheme(Brightness.light),
      darkTheme: createTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
