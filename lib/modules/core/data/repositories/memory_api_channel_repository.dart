import 'dart:async';

import 'package:bbun/modules/core/domain/enums/api_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bbun/modules/core/data/dio/bbun_dio.dart';
import '../../domain/repositories/api_channel_repository.dart';

@Singleton(
  as: ApiChannelRepository,
  dispose: MemoryApiChannelRepository.dispose,
)
class MemoryApiChannelRepository implements ApiChannelRepository {
  final _subject = BehaviorSubject<ApiChannel>.seeded(ApiChannel.byMode());
  late final StreamSubscription<ApiChannel> _localSubscription;
  final BbunDio _bbunDio;

  MemoryApiChannelRepository(this._bbunDio) {
    _localSubscription = _subject.listen((value) {
      _bbunDio.options.baseUrl = value.bbunBaseUrl;
    });
  }

  static FutureOr dispose(ApiChannelRepository repository) {
    final repo = repository as MemoryApiChannelRepository;
    repo._localSubscription.cancel();
    repo._subject.close();
  }

  @override
  void setChannel(ApiChannel channel) {
    _subject.add(channel);
  }

  @override
  ApiChannel toggleChannel() {
    final channel = _subject.value.oppose;
    _subject.add(channel);
    return channel;
  }

  @override
  String get bbunBaseUrl => _subject.value.bbunBaseUrl;

  @override
  Stream<ApiChannel> get channel => _subject.stream;
}
