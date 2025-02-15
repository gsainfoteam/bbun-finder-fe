// ignore: implementation_imports
import 'package:dio/src/dio/dio_for_browser.dart';
import 'package:bbun/modules/user/data/repositories/bbun_cookie_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:bbun/modules/user/data/data_sources/remote/bbun_authorize_interceptor.dart';

@singleton
class BbunDio extends DioForBrowser {
  BbunDio(
    BbunAuthorizeInterceptor authorizeInterceptor,
    BbunCookieManager cookieManager,
  ) {
    interceptors.addAll([authorizeInterceptor, cookieManager]);
  }
}
