class YoutubeItemModel {
  final String url;
  final String? saveTo;
  final num? speed;

  YoutubeItemModel({
    required this.url,
    this.saveTo,
    this.speed,
  });
}
