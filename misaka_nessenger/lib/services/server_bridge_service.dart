import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import 'package:json_annotation/json_annotation.dart';

/// Enum flags to indicate MisakaNessengerServer running status.
enum RunningStatus {
  /// Unknown server status.
  unknown,

  /// Server is closed.
  closed,

  /// Server is running.
  running,
}

/// Service to fetch MisakaNessengerServer status.
class ServerBridgeService extends GetxService {
  RunningStatus _serverStatus = RunningStatus.unknown;

  /// Get server status.
  RunningStatus get serverStatus => _serverStatus;

  /// Init before app start.
  Future<ServerBridgeService> init() async {
    await _fetchServerStatus();
    return this;
  }

  Future<void> _fetchServerStatus() async {
    try {
      final resp = await Dio().get('http://localhost:10032/status');
      final respData = resp.data;
      if (respData is! Map<String, dynamic>) {
        throw Exception(
          'invalid response data type: ${respData.runtimeType.toString()}',
        );
      }
      final statusData = respData['status'];
      final configData = respData['config'];
      print('server status: $statusData $configData');
    } catch (e) {
      print('error fetching server status! $e');
      return;
    }
    _serverStatus = RunningStatus.running;
  }
}
