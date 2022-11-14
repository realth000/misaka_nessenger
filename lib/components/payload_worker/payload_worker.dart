import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:grpc/grpc.dart';
import 'package:path/path.dart' as path;

import '../../api/protos/generated/messenger.pbgrpc.dart';

/// Worker to run send tasks.
///
/// Send messages and files to remote machine.
/// Now [remoteHost] and [remotePort] should set in construction, which means we
/// can NOT change them later.
/// In future, set this as a config, remains a certain workers in a worker pool
/// to avoid frequently creating and disposing [PayloadWorker] objecets.
class PayloadWorker {
  /// Constructor, should call grpc channel.
  PayloadWorker({
    required this.filePath,
    this.remoteHost = '',
    this.remotePort = -1,
  }) {
    fileName = path.basename(filePath);
    fileSize = File(filePath).statSync().size;
  }

  /// Remote host to send.
  ///
  /// IP: xxx.xxx.xxx.xxx
  String remoteHost;

  /// Remote host port to send.
  ///
  /// Should in [0,65535].
  int remotePort;

  /// Local file path of the file to send.
  final String filePath;

  /// Local file name.
  late final String fileName;

  /// Local file size.
  late final int fileSize;

  /// Controller of [finishSizeStream].
  final _finishSizeStreamController =
      StreamController<int>.broadcast(sync: true);

  /// File size stream, let UI controller to listen.
  late final finishSizeStream = _finishSizeStreamController.stream;

  /// Sink of [finishSizeStream].
  late final _finishSizeStreamSink = _finishSizeStreamController.sink;

  late final MessengerClient _client;
  late final ClientChannel _channel;

  /// send the file in [filePath] to remote host [remoteHost] on remote port
  /// [remotePort].
  ///
  /// If file not exists, return false.
  /// When file send complete, return true.
  Future<bool> sendFile() async {
    // Init GRPC client channel.
    // Set remote host and port, with other options.
    // TODO: Support TLS.
    _channel = ClientChannel(
      remoteHost,
      port: remotePort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    // Init proto client objects.
    _client = MessengerClient(
      _channel,
      options: CallOptions(
        metadata: {'ClientID': '123'},
        timeout: const Duration(seconds: 10),
      ),
    );
    final file = File(filePath);
    if (!file.existsSync()) {
      _finishSizeStreamSink.addError('File not exists'.tr);
      return false;
    }
    final stream = file.openRead();
    await _client.sendFile(_generateSendRequestStream(stream));
    return true;
  }

  /// Generate a stream of [SendFileRequest] to send files form a file binary
  /// stream.
  Stream<SendFileRequest> _generateSendRequestStream(
    Stream<List<int>> fileDataStream,
  ) async* {
    await for (final s in fileDataStream) {
      final req = SendFileRequest()
        ..fileName = fileName
        ..fileSource = filePath
        ..fileContent = s
        ..fileSize = fileSize;
      _finishSizeStreamSink.add(s.length);
      print('AAAA ADD TO STREAM ${fileName} ${s.length}');
      print('AAAA [SENDER] send file $fileName [${s.length} Bytes]');
      yield req;
    }
  }
}
