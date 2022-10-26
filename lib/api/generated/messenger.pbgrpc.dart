///
//  Generated code. Do not modify.
//  source: messenger.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'messenger.pb.dart' as $0;
export 'messenger.pb.dart';

class MessengerClient extends $grpc.Client {
  static final _$sendFile =
      $grpc.ClientMethod<$0.SendFileRequest, $0.SendFileReply>(
          '/messenger.Messenger/SendFile',
          ($0.SendFileRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SendFileReply.fromBuffer(value));

  MessengerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.SendFileReply> sendFile(
      $async.Stream<$0.SendFileRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendFile, request, options: options).single;
  }
}

abstract class MessengerServiceBase extends $grpc.Service {
  $core.String get $name => 'messenger.Messenger';

  MessengerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendFileRequest, $0.SendFileReply>(
        'SendFile',
        sendFile,
        true,
        false,
        ($core.List<$core.int> value) => $0.SendFileRequest.fromBuffer(value),
        ($0.SendFileReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendFileReply> sendFile(
      $grpc.ServiceCall call, $async.Stream<$0.SendFileRequest> request);
}
