import 'package:block_downloader/colors.dart';
import 'package:block_downloader/theme.dart';
import 'package:block_downloader/widgets/youtube_quality_selector.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeDownloadButton extends StatefulWidget {
  final StreamManifest streamManifest;

  const YoutubeDownloadButton({Key? key, required this.streamManifest})
      : super(key: key);

  @override
  State<YoutubeDownloadButton> createState() => YoutubeDownloadButtonState();
}

class YoutubeDownloadButtonState extends State<YoutubeDownloadButton> {
  void onDownloaded() {
    showPopover(
      context: context,
      backgroundColor: background,
      width: spacing(50),
      bodyBuilder: (BuildContext context) {
        return YoutubeQualitySelector(streamManifest: widget.streamManifest);
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
