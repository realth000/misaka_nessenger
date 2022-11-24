///
//  Generated code. Do not modify.
//  source: messenger.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SendFileRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendFileRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messenger'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileName', protoName: 'fileName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileSource', protoName: 'fileSource')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileContent', $pb.PbFieldType.OY, protoName: 'fileContent')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileSize', $pb.PbFieldType.O3, protoName: 'fileSize')
    ..hasRequiredFields = false
  ;

  SendFileRequest._() : super();
  factory SendFileRequest({
    $core.String? fileName,
    $core.String? fileSource,
    $core.List<$core.int>? fileContent,
    $core.int? fileSize,
  }) {
    final _result = create();
    if (fileName != null) {
      _result.fileName = fileName;
    }
    if (fileSource != null) {
      _result.fileSource = fileSource;
    }
    if (fileContent != null) {
      _result.fileContent = fileContent;
    }
    if (fileSize != null) {
      _result.fileSize = fileSize;
    }
    return _result;
  }
  factory SendFileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFileRequest clone() => SendFileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFileRequest copyWith(void Function(SendFileRequest) updates) => super.copyWith((message) => updates(message as SendFileRequest)) as SendFileRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendFileRequest create() => SendFileRequest._();
  SendFileRequest createEmptyInstance() => create();
  static $pb.PbList<SendFileRequest> createRepeated() => $pb.PbList<SendFileRequest>();
  @$core.pragma('dart2js:noInline')
  static SendFileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFileRequest>(create);
  static SendFileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileSource => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileSource($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileSource() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get fileContent => $_getN(2);
  @$pb.TagNumber(3)
  set fileContent($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileContent() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get fileSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set fileSize($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFileSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileSize() => clearField(4);
}

class SendFileReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SendFileReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'messenger'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'finishedFileSize', $pb.PbFieldType.OU3, protoName: 'finishedFileSize')
    ..hasRequiredFields = false
  ;

  SendFileReply._() : super();
  factory SendFileReply({
    $core.int? finishedFileSize,
  }) {
    final _result = create();
    if (finishedFileSize != null) {
      _result.finishedFileSize = finishedFileSize;
    }
    return _result;
  }
  factory SendFileReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendFileReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendFileReply clone() => SendFileReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendFileReply copyWith(void Function(SendFileReply) updates) => super.copyWith((message) => updates(message as SendFileReply)) as SendFileReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendFileReply create() => SendFileReply._();
  SendFileReply createEmptyInstance() => create();
  static $pb.PbList<SendFileReply> createRepeated() => $pb.PbList<SendFileReply>();
  @$core.pragma('dart2js:noInline')
  static SendFileReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendFileReply>(create);
  static SendFileReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get finishedFileSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set finishedFileSize($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFinishedFileSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearFinishedFileSize() => clearField(1);
}

