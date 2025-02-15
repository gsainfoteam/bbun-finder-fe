import 'package:flutter/foundation.dart';

enum ApiChannel {
  staging(
    'https://api.stg.bbun.gistory.me/',
  ),
  production(
    'https://api.bbun.gistory.me/',
  );

  final String bbunBaseUrl;
  const ApiChannel(
    this.bbunBaseUrl,
  );

  factory ApiChannel.byMode() => kDebugMode ? staging : production;
  ApiChannel get oppose => this == staging ? production : staging;
}
