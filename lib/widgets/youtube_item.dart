import 'package:block_downloader/models/youtube_item.dart';
import 'package:flutter/material.dart';

class YoutubeItem extends StatelessWidget {
  final YoutubeItemModel item;

  const YoutubeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item.video.thumbnails.standardResUrl),
      ),
    );
  }
}
