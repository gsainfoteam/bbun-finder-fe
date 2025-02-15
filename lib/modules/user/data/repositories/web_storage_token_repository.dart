import 'dart:async';
import 'dart:html' as html;
import 'package:rxdart/rxdart.dart';
import 'package:bbun/modules/user/domain/repositories/token_repository.dart';

abstract class WebStorageTokenRepository implements TokenRepository {
  final String tokenKey;
  final String expiredAtKey;

  final _subject = BehaviorSubject<String?>.seeded(null);
  final _expiredAtSubject = BehaviorSubject<DateTime?>.seeded(null);

  WebStorageTokenRepository({
    required this.tokenKey,
    required this.expiredAtKey,
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
  }

  static void dispose(TokenRepository repository) {
    (repository as WebStorageTokenRepository)
      .._subject.close()
      .._expiredAtSubject.close();
  }

  @override
  Stream<String?> get token => _subject.stream;

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

    html.window.localStorage.remove(tokenKey);
    html.window.localStorage.remove(expiredAtKey);
  }

  @override
  DateTime? get tokenExpiration => _expiredAtSubject.value;
}
