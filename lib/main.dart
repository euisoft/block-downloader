import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));

  doWhenWindowReady(() {
    const initialSize = Size(600, 600);
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
      home: MoveWindow(child: const Home()),
      debugShowCheckedModeBanner: false,
    );
  }
}
