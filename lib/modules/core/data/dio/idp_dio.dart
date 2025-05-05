import 'package:dio/browser.dart';
import 'package:injectable/injectable.dart';

@singleton
class IdPDio extends DioForBrowser {
  IdPDio() {
    options.baseUrl = 'https://api.idp.gistory.me/';
  }
}
