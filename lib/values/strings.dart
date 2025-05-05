import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Strings {
  Strings._();

  static final idpBaseUrl = dotenv.get('IDP_BASE_URL');
  static final bbunIdpClientId = dotenv.get('BBUN_IDP_CLIENT_ID');
  static final bbunRedirectUri = dotenv.get('BBUN_REDIRECT_URI');
}
