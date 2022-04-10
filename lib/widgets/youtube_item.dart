import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeItem extends StatelessWidget {
  final YoutubeItemModel item;

  const YoutubeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: yt.videos.get(item.url),
      builder: (context, AsyncSnapshot<Video> value) {
        if (value.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator();
        }

        if (value.hasData) {
          Video video = value.data!;

          return ListTile(
            title: Text(video.title),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
