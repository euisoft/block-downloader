import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/header.dart';
import 'package:block_downloader/widgets/list_youtube_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: spacing(4)),
        child: Column(
          children: const [
            Header(),
            Divider(),
            Flexible(child: ListYoutubeItem()),
          ],
        ),
      ),
    );
  }
}
