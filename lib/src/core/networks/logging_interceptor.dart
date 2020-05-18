import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor{

  @override
  Future<dynamic> onRequest(RequestOptions options) {
    print('\n');
    print('--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${'' + (options.baseUrl ?? '') + (options.path ?? '')}');
    print('Headers:');
    options.headers.forEach((k, dynamic v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print('queryParameters:');
      options.queryParameters.forEach((k, dynamic v) => print('$k: $v'));
    }
    if (options.data != null) {
      print('Body: ${options.data}');
    }
    print('--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}');

    return super.onRequest(options);
  }

  @override
  Future onError(DioError dioError) {
    print('\n');
    print('<-- ${dioError.message} ${dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL'}');
    print('${dioError.response != null ? dioError.response.data : 'Unknown Error'}');
    print('<-- End error');
    return super.onError(dioError);
  }

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