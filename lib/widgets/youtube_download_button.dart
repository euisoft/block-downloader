import 'dart:io';

import 'package:block_downloader/colors.dart';
import 'package:block_downloader/services/file.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/youtube_quality_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:popover/popover.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeDownloadButton extends ConsumerStatefulWidget {
  final Video video;
  final StreamManifest streamManifest;

  const YoutubeDownloadButton({
    Key? key,
    required this.streamManifest,
    required this.video,
  }) : super(key: key);

  @override
  YoutubeDownloadButtonState createState() => YoutubeDownloadButtonState();
}

class YoutubeDownloadButtonState extends ConsumerState<YoutubeDownloadButton> {
  void onSelected(StreamInfo streamInfo) async {
    if (await fileService.isDownloadFolderExists) {
      Stream stream = yt.videos.streamsClient.get(streamInfo);

      String tempSavePath =
          await fileService.getTempSavePath(widget.video.title);
      File file = File(tempSavePath);
      IOSink sink = file.openWrite();

      stream.pipe(sink);
    }
  }

  void onDownloaded() {
    showPopover(
      context: context,
      backgroundColor: background,
      width: spacing(50),
      bodyBuilder: (BuildContext context) {
        return YoutubeQualitySelector(
          streamManifest: widget.streamManifest,
          onSelected: onSelected,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onDownloaded,
      icon: const Icon(Icons.arrow_downward),
    );
  }
}
