import 'package:block_downloader/models/youtube_data.dart';
import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/loading.dart';
import 'package:block_downloader/widgets/youtube_download_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeItem extends StatelessWidget {
  final YoutubeItemModel item;

  const YoutubeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  void onDownloaded() {}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: youtubeService.getData(item.url),
      builder: (context, AsyncSnapshot<YoutubeDataModel> value) {
        if (value.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (value.hasData) {
          YoutubeDataModel data = value.data!;
          Video video = data.video;
          StreamManifest streamManifest = data.streamManifest;

          return ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: spacing()),
              child: Text(
                video.title,
                style: Get.theme.textTheme.bodyText1,
              ),
            ),
            subtitle: Text(
              video.author,
              style: Get.theme.textTheme.caption,
            ),
            trailing: YoutubeDownloadButton(streamManifest: streamManifest),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
