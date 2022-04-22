import 'dart:async';
import 'dart:io';

import 'package:block_downloader/colors.dart';
import 'package:block_downloader/services/file.dart';
import 'package:block_downloader/services/youtube.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/types/download.dart';
import 'package:block_downloader/widgets/action_button.dart';
import 'package:block_downloader/widgets/circular_percent.dart';
import 'package:block_downloader/widgets/youtube_quality_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  double percent = 0;
  num downloadedBytes = 0;
  DownloadStatus downloadStatus = DownloadStatus.idle;

  late StreamSubscription subscription;
  late File file;
  late IOSink sink;

  void onSelected(StreamInfo streamInfo) async {
    Get.back();

    if (await fileService.isDownloadFolderExists) {
      Stream stream = yt.videos.streamsClient.get(streamInfo);

      String tempSavePath =
          await fileService.getTempSavePath(widget.video.title);
      file = File(tempSavePath);
      sink = file.openWrite();

      subscription = stream.listen(
        (bytes) => onAddedData(bytes, streamInfo),
        onDone: () => onDone(streamInfo),
        onError: (error) {},
        cancelOnError: true,
      );
    }
  }

  void onPaused() {
    setState(() {
      if (subscription.isPaused) {
        subscription.resume();
      } else {
        subscription.pause();
      }
    });
  }

  void onCanceled() {
    subscription.cancel();
    onDeleted();
  }

  void onDeleted() async {
    await sink.flush();
    await sink.close();
    await file.delete();

    setState(() {
      downloadedBytes = 0;
      percent = 0;
      downloadStatus = DownloadStatus.idle;
    });
  }

  void onDone(StreamInfo streamInfo) async {
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

  void onAddedData(List<int> bytes, StreamInfo streamInfo) {
    sink.add(bytes);

    setState(() {
      downloadedBytes += bytes.length;
      percent = (downloadedBytes / streamInfo.size.totalBytes);
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
    if (downloadStatus == DownloadStatus.downloading) {
      return Tooltip(
        message: 'Click: Pause / Double Click: Cancel',
        child: ActionButton(
          onTap: onPaused,
          onDoubleTap: onCanceled,
          child: CircularPercent(
            percent: percent,
            isPaused: subscription.isPaused,
          ),
        ),
      );
    }

    return ActionButton(
      onTap: onDownloaded,
      child: const Icon(Icons.arrow_downward),
    );
  }
}
