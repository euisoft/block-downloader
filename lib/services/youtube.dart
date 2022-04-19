import 'package:block_downloader/models/youtube_data.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

YoutubeExplode yt = YoutubeExplode();

class YoutubeService {
  Future<YoutubeDataModel> getData(String url) async {
    Video video = await yt.videos.get(url);
    StreamManifest streamManifest =
        await yt.videos.streamsClient.getManifest(video.id);

    return YoutubeDataModel(
      video: video,
      streamManifest: streamManifest,
    );
  }
}

YoutubeService youtubeService = YoutubeService();
