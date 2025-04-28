import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late final WebSocketChannel _channel;
  late final Stream _stream;

  WebSocketService(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _stream = _channel.stream.asBroadcastStream(); // <-- Important part!
  }

  Stream get stream => _stream;

  void send(dynamic data) {
    _channel.sink.add(data);
  }

  void close() {
    _channel.sink.close();
  }
}
