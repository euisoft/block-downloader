import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class DownloadModel {
  late StreamInfo streamInfo;

  DownloadModel copyWith({required StreamInfo streamInfo}) {
    this.streamInfo = streamInfo;
    return this;
  }
}
