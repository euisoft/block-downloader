import 'package:block_downloader/widgets/sticky_header_content.dart';
import 'package:block_downloader/widgets/sticky_header_title.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeQualitySelector extends StatelessWidget {
  final StreamManifest streamManifest;

  const YoutubeQualitySelector({
    Key? key,
    required this.streamManifest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<VideoStreamInfo> videoSortByVideoQuality =
        streamManifest.video.sortByVideoQuality();

    List<AudioOnlyStreamInfo> audioOnlySortByBitrate =
        streamManifest.audioOnly.sortByBitrate();

    List<VideoOnlyStreamInfo> videoOnlySortByQuality =
        streamManifest.videoOnly.sortByVideoQuality();

    return ListView(
      shrinkWrap: true,
      children: [
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Video'),
          content: StickyHeaderContent(qualities: videoSortByVideoQuality),
        ),
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Audio Only'),
          content: StickyHeaderContent(qualities: audioOnlySortByBitrate),
        ),
        StickyHeader(
          header: const StickyHeaderTitle(title: 'Video Only'),
          content: StickyHeaderContent(qualities: videoOnlySortByQuality),
        ),
      ],
    );
  }
}
