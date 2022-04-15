import 'package:block_downloader/theme.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class StickyHeaderContent extends StatelessWidget {
  final List<StreamInfo> streamInfos;
  final ValueChanged<StreamInfo> onSelected;

  const StickyHeaderContent({
    Key? key,
    required this.streamInfos,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: streamInfos
          .map(
            (streamInfo) => InkWell(
              onTap: () => onSelected(streamInfo),
              child: Container(
                padding: EdgeInsets.all(spacing(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(streamInfo.qualityLabel),
                    Text(streamInfo.bitrate.toString()),
                    Text(streamInfo.size.toString()),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
