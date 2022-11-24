import 'dart:async';

/// GRPC connection in PayloadServer, receive.
class PayloadServeConnection {
  /// Constructor.
  PayloadServeConnection({
    required this.filePath,
    required this.fileName,
    required this.fileSize,
  });

  /// File path, identify connection.
  String filePath;

  /// File name to receive.
  String fileName;

  /// File size in Bytes.
  int fileSize;

  /// Finished receiving Bytes.
  int finishedSize = 0;

  /// If payload work finished.
  bool finished = false;

  /// If payload work succeed.
  bool succeed = false;

  /// Controller of [finishSizeStream].
  final _finishSizeStreamController =
      StreamController<int>.broadcast(sync: true);

  /// File size stream, let UI controller to listen.
  late final finishSizeStream = _finishSizeStreamController.stream;

  /// Sink of [finishSizeStream].
  late final _finishSizeStreamSink = _finishSizeStreamController.sink;

  /// Update finished by size.
  ///
  /// MUST call this from [PayloadServer].
  void addFinishSize(int size) {
    _finishSizeStreamSink.add(size);
    finishedSize += size;
  }

  /// There always size deviation between [fileSize] and [finishedSize] after
  /// work complete without error.
  /// Call this to force set [finishedSize] equal to [fileSize].
  void forceCompleteFinishedSize() {
    _finishSizeStreamSink.add(fileSize - finishedSize);
    finishedSize = fileSize;
    _finishSizeStreamSink.close();
  }
}
