import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeItemModel {
  final Video video;
  final String? saveTo;
  final num? speed;

  YoutubeItemModel({
    required this.video,
    this.saveTo,
    this.speed,
  });
}
