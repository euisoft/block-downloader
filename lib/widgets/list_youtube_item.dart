import 'package:block_downloader/models/youtube_item.dart';
import 'package:block_downloader/states/youtube.dart';
import 'package:block_downloader/widgets/youtube_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListYoutubeItem extends ConsumerWidget {
  const ListYoutubeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<YoutubeItemModel> items = ref.watch(youtubeProvider);

    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        YoutubeItemModel item = items[index];
        return YoutubeItem(item: item);
      },
    );
  }
}
