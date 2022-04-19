import 'package:block_downloader/models/youtube_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Youtube extends StateNotifier<List<YoutubeItemModel>> {
  Youtube() : super([]);

  void add(YoutubeItemModel item) {
    state = [
      ...state,
      item,
    ];
  }
}

final youtubeProvider =
    StateNotifierProvider<Youtube, List<YoutubeItemModel>>((_) => Youtube());
