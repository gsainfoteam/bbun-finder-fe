import 'package:bbun/modules/user/data/data_sources/remote/bbun_authorize_interceptor.dart';
import 'package:bbun/modules/user/data/repositories/bbun_cookie_manager.dart';
import 'package:dio/browser.dart';
import 'package:injectable/injectable.dart';

@singleton
class BbunDio extends DioForBrowser {
  BbunDio(
    BbunAuthorizeInterceptor authorizeInterceptor,
    BbunCookieManager cookieManager,
  ) {
    interceptors.addAll([authorizeInterceptor, cookieManager]);
  }
}
