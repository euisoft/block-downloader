import 'dart:io';

import 'package:block_downloader/colors.dart';
import 'package:block_downloader/services/file.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/types/download.dart';
import 'package:block_downloader/widgets/youtube_quality_selector.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeDownloadButton extends StatefulWidget {
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

class YoutubeDownloadButtonState extends State<YoutubeDownloadButton> {
  DownloadStatus downloadStatus = DownloadStatus.idle;
  num percent = 0;
  num downloadedBytes = 0;

  void onSelected(StreamInfo streamInfo) async {
    if (await fileService.isDownloadFolderExists) {
      Stream stream = yt.videos.streamsClient.get(streamInfo);

      String tempSavePath =
          await fileService.getTempSavePath(widget.video.title);
      File file = File(tempSavePath);
      IOSink sink = file.openWrite();

      stream.listen(
        (bytes) => onAddedData(bytes, sink, streamInfo),
        onError: (error) {},
        onDone: () => onDone(sink, streamInfo, file),
        cancelOnError: true,
      );
    }
  }

  void onDone(IOSink sink, StreamInfo streamInfo, File file) async {
    await sink.flush();
    await sink.close();

    String savePath = await fileService.getSavePath(
      widget.video.title,
      streamInfo.codec.subtype,
    );

    await file.rename(savePath);

    setState(() {
      downloadedBytes = 0;
      percent = 0;
      downloadStatus = DownloadStatus.success;
    });
  }

  void onAddedData(List<int> bytes, IOSink sink, StreamInfo streamInfo) {
    sink.add(bytes);

    setState(() {
      downloadedBytes += bytes.length;
      percent = (downloadedBytes / streamInfo.size.totalBytes * 100).floor();
      downloadStatus = DownloadStatus.downloading;
    });
  }

  void onDownloaded() {
    showPopover(
      context: context,
      backgroundColor: background,
      width: spacing(60),
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
