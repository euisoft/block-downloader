import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

RegExp invalidChars = RegExp(r'[\\\/:*?"<>|]');

class FileService {
  Future<String> get getDownloadFolder async {
    try {
      Directory? directory = await getDownloadsDirectory();

      return directory!.path;
    } catch (error) {
      if (error is UnsupportedError) {
        return throw Exception(error.message);
      }

      return throw Exception('Something went wrong');
    }
  }

  Future<bool> get isDownloadFolderExists async {
    Directory? downloadFolder = await getDownloadsDirectory();

    return await downloadFolder?.exists() ?? false;
  }

  Future<String> mapWithDownloadFolder(String name) async {
    return join(await getDownloadFolder, name);
  }

  Future<String> getTempSavePath(String title) async {
    String titleWithoutInvalidChars = removeInvalidChars(title);
    String temporarySavePath = 'Unconfirmed $titleWithoutInvalidChars.bd';

    return await mapWithDownloadFolder(temporarySavePath);
  }

  String removeInvalidChars(String value) {
    return value.replaceAll(invalidChars, '');
  }
}

FileService fileService = FileService();
