import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:block_downloader/styles/theme.dart';
import 'package:block_downloader/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = 'Block Downloader';
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Block Downloader',
      theme: createTheme(Brightness.light),
      darkTheme: createTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      home: MoveWindow(
        child: WindowTitleBarBox(
          child: const Home(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
