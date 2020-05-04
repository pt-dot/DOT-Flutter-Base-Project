import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor{

  @override
  Future<dynamic> onResponse(Response<dynamic> response) {
    print('\n\n');
    print('<--- HTTP CODE : ${response.statusCode} URL : ${response.request.baseUrl}${response.request.path}');
    print('Headers: ');
    printWrapped('Response : ${response.data}');
    print('<--- END HTTP');
    return super.onResponse(response);
  }

  void printWrapped(String text) {
    final RegExp pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((RegExpMatch match) => print(match.group(0)));
  }

}