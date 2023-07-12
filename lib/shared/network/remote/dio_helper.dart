// TODO Implement this library.
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '***************',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-type': 'application/json',
          'Accept-Language': 'ar',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
      'Accept-Language': 'ar',
    };
    // ignore: void_checks
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postdata({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };
    return await dio.post(
      url,
      data: data,
    );
  }
}
