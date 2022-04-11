import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/styles/theme.dart';
import 'package:block_downloader/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          return const Loading();
        }

        if (value.hasData) {
          Video video = value.data!;

          return ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: spacing()),
              child: Text(video.title, style: Get.theme.textTheme.bodyMedium),
            ),
            subtitle: Text(video.author, style: Get.theme.textTheme.caption),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
