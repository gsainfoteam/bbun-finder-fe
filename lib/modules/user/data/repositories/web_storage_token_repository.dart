import 'dart:async';
import 'dart:html' as html;

import 'package:bbun/modules/user/domain/repositories/token_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class WebStorageTokenRepository implements TokenRepository {
  final String tokenKey;
  final String expiredAtKey;
  final String refreshTokenKey;
  final String refreshTokenExpiredAtKey;

  final _subject = BehaviorSubject<String?>();
  final _expiredAtSubject = BehaviorSubject<DateTime?>();
  final _refreshTokenSubject = BehaviorSubject<String?>();
  final _refreshTokenExpiredAtSubject = BehaviorSubject<DateTime?>();

  WebStorageTokenRepository({
    required this.tokenKey,
    required this.expiredAtKey,
    required this.refreshTokenKey,
    required this.refreshTokenExpiredAtKey,
  }) {
    _init();
  }

  Future<void> _init() async {
    final token = html.window.localStorage[tokenKey];
    final expiredAtString = html.window.localStorage[expiredAtKey];

    _subject.add(token);
    _expiredAtSubject.add(
      expiredAtString != null ? DateTime.tryParse(expiredAtString) : null,
    );

    final refreshToken = html.window.localStorage[refreshTokenKey];
    final refreshTokenExpiredAtString =
        html.window.localStorage[refreshTokenExpiredAtKey];

    _refreshTokenSubject.add(refreshToken);
    _refreshTokenExpiredAtSubject.add(
      refreshTokenExpiredAtString != null
          ? DateTime.tryParse(refreshTokenExpiredAtString)
          : null,
    );
  }

  static void dispose(TokenRepository repository) {
    (repository as WebStorageTokenRepository)
      .._subject.close()
      .._expiredAtSubject.close()
      .._refreshTokenSubject.close()
      .._refreshTokenExpiredAtSubject.close();
  }

  @override
  Stream<String?> get token => _subject.stream;

  @override
  Stream<String?> get refreshToken => _refreshTokenSubject.stream;

  @override
  Future<void> saveToken(String token,
      {Duration duration = const Duration(seconds: 3600)}) async {
    final expiration = DateTime.now().add(duration);
    _subject.add(token);
    _expiredAtSubject.add(expiration);

    html.window.localStorage[tokenKey] = token;
    html.window.localStorage[expiredAtKey] = expiration.toIso8601String();
  }

  @override
  Future<void> deleteToken() async {
    _subject.add(null);
    _expiredAtSubject.add(null);
    _refreshTokenSubject.add(null);
    _refreshTokenExpiredAtSubject.add(null);

    html.window.localStorage.remove(tokenKey);
    html.window.localStorage.remove(expiredAtKey);
    html.window.localStorage.remove(refreshTokenKey);
    html.window.localStorage.remove(refreshTokenExpiredAtKey);
  }

  @override
  DateTime? get tokenExpiration => _expiredAtSubject.value;

  @override
  DateTime? get refreshTokenExpiration => _refreshTokenExpiredAtSubject.value;

  @override
  Future<void> saveRefreshToken(String token,
      {Duration duration = const Duration(days: 180)}) async {
    _refreshTokenSubject.add(token);
    _refreshTokenExpiredAtSubject.add(DateTime.now().add(duration));
    html.window.localStorage[refreshTokenKey] = token;
    html.window.localStorage[refreshTokenExpiredAtKey] =
        DateTime.now().add(duration).toIso8601String();
  }
}
