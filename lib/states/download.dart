import 'package:block_downloader/models/download.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class Download extends StateNotifier<DownloadModel> {
  Download() : super(DownloadModel());

  void onSelected(StreamInfo streamInfo) {
    state = state.copyWith(streamInfo: streamInfo);
  }
}

final downloadProvider = StateNotifierProvider<Download, DownloadModel>(
  (_) => Download(),
);
