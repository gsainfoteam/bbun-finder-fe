import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class BbunCookieManager implements Interceptor {
  Future<void> saveCookie(String key, String value) async {
    html.document.cookie = '$key=$value; path=/';
  }

  Future<String?> getCookie(String key) async {
    final cookies = html.document.cookie?.split('; ') ?? [];
    for (var cookie in cookies) {
      final parts = cookie.split('=');
      if (parts[0] == key) return parts[1];
    }
    return null;
  }

  Future<void> deleteAllCookies() async {
    final cookies = html.document.cookie?.split('; ') ?? [];
    for (var cookie in cookies) {
      final key = cookie.split('=')[0];
      html.document.cookie =
          '$key=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
