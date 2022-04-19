import 'package:block_downloader/widgets/sticky_header_content.dart';
import 'package:block_downloader/widgets/sticky_header_title.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeQualitySelector extends StatelessWidget {
  final StreamManifest streamManifest;
  final ValueChanged<StreamInfo> onSelected;

  const YoutubeQualitySelector({
    Key? key,
    required this.streamManifest,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VideoStreamInfo> muxedSortByVideoQuality = streamManifest.muxed;

    List<AudioOnlyStreamInfo> audioOnlySortByBitrate =
        streamManifest.audioOnly.sortByBitrate();

    List<VideoOnlyStreamInfo> videoOnlySortByQuality =
        streamManifest.videoOnly.sortByVideoQuality();

    return ListView(
      shrinkWrap: true,
      children: [
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Video'),
          content: StickyHeaderContent(
            streamInfos: muxedSortByVideoQuality,
            onSelected: onSelected,
          ),
        ),
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Audio Only'),
          content: StickyHeaderContent(
            streamInfos: audioOnlySortByBitrate,
            onSelected: onSelected,
          ),
        ),
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Video Only'),
          content: StickyHeaderContent(
            streamInfos: videoOnlySortByQuality,
            onSelected: onSelected,
          ),
        ),
      ],
    );
  }
}
