import 'package:block_downloader/colors.dart';
import 'package:block_downloader/models/youtube_data.dart';
import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/background_percent.dart';
import 'package:block_downloader/widgets/download_button.dart';
import 'package:block_downloader/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeItem extends StatefulWidget {
  final YoutubeItemModel item;

  const YoutubeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<YoutubeItem> createState() => YoutubeItemState();
}

class YoutubeItemState extends State<YoutubeItem> {
  Future<YoutubeDataModel>? youtubeFuture;
  double percent = 0;

  void onProcessed(double percent) {
    setState(() {
      this.percent = percent;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      youtubeFuture = youtubeService.getData(widget.item.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: youtubeFuture,
      builder: (context, AsyncSnapshot<YoutubeDataModel> value) {
        if (value.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        if (value.hasData) {
          YoutubeDataModel data = value.data!;
          Video video = data.video;
          StreamManifest streamManifest = data.streamManifest;

          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: spacing(2),
              vertical: spacing(),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(color: componentBackground.withOpacity(0.5)),
                ),
                BackgroundPercent(percent: percent),
                Container(
                  padding: EdgeInsets.all(spacing(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            video.title,
                            maxLines: 1,
                            style: Get.theme.textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            video.author,
                            style: Get.theme.textTheme.caption,
                          )
                        ],
                      ),
                      DownloadButton(
                        video: video,
                        streamManifest: streamManifest,
                        onProcessed: onProcessed,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
