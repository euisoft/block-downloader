import 'package:block_downloader/styles/colors.dart';
import 'package:block_downloader/styles/theme.dart';
import 'package:block_downloader/widgets/header.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: spacing(4)),
        child: Column(
          children: [
            Header(),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
