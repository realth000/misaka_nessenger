import 'dart:async';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;

/// Worker class to handle payload tasks.
class PayloadWorker {
  /// Constructor.
  ///
  /// Need to specify related filePath.
  PayloadWorker({
    required this.filePath,
    this.remoteHost = '',
    this.remotePort = -1,
    this.remoteRoutePath = '/upload',
    this.headerKey = 'file',
  }) {
    fileName = path.basename(filePath);
  }

  /// Remote host IP: xxx.xxx.xxx.xxx.
  String remoteHost;

  /// Remote host port: 0~65535.
  int remotePort;

  /// Remote route path: /upload.
  String remoteRoutePath;

  /// File path of the related file, is a local file on local machine.
  final String filePath;

  /// File name of the related file, part of [filePath].
  late final String fileName;

  /// File size of the related file, size in Bytes.
  int fileSize = 1;

  /// Size of Bytes that already finished.
  int finishedSize = 0;

  /// Flag for finished or not.
  bool finished = false;

  /// Flag for
  /// * succeed (finished with no error)
  /// or
  /// * not (not finished or finished with error).
  bool succeed = false;

  /// Header key used in upload post request.
  String headerKey;

  /// Stream controller of [finishedSizeStream].
  final _finishedSizeSC = StreamController<int>.broadcast(sync: true);

  /// Stream for [finishedSize].
  ///
  /// Used by UI to update payload task status.
  late final finishedSizeStream = _finishedSizeSC.stream;

  /// Stream sink of [_finishedSizeSC].
  late final _finishedSizeSS = _finishedSizeSC.sink;

  /// Start send file.
  Future<bool> sendFile() async {
    final dio = Dio();
    final data = FormData.fromMap({
      headerKey: await MultipartFile.fromFile(filePath, filename: fileName),
    });
    late final Response resp;
    try {
      resp = await dio.post(
        'http://$remoteHost:$remotePort$remoteRoutePath',
        data: data,
        onSendProgress: (send, total) {
          finishedSize = send;
          fileSize = total;
          _finishedSizeSS.add(finishedSize);
        },
      );
      if (resp.statusCode != 200) {
        print(
            'Error sending file $filePath, status=${resp.statusCode}, message = ${resp.statusMessage}');
        return false;
      }
    } catch (e) {
      print('AAAA !!!!!!!!error: $e');
      print(
          'Error sending file $filePath, status=${resp.statusCode}, message = ${resp.statusMessage}');
    }
    return true;
  }
}
