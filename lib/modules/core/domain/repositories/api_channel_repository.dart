import 'package:bbun/modules/core/domain/enums/api_channel.dart';

abstract class ApiChannelRepository {
  void setChannel(ApiChannel channel);
  ApiChannel toggleChannel();
  String get bbunBaseUrl;
  Stream<ApiChannel> get channel;
}
