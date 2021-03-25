import 'constants.dart';
import 'package:dio/dio.dart';

class APIStorage {
  Future<Map<String, dynamic>> get _localFile async {
    try {
      Response response = await dio.get(
        quotesAPI,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    } catch (e) {
      Response response = await dio.get(
        quotesAPI,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    }
  }
  Future<Map<String,dynamic>> readCounter() async {
    Future<Map<String, dynamic>> data = _localFile;
    return data;
  }
}

class WallpaperAPIStorage {
  Future<Map<String, dynamic>> get _localFile async {
    try {
      Response response = await dio.get(
        wallpapersAPI,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    } catch (e) {
      Response response = await dio.get(
        wallpapersAPI,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    }
  }
  Future<Map<String,dynamic>> readCounter() async {
    Future<Map<String, dynamic>> data = _localFile;
    return data;
  }
}
