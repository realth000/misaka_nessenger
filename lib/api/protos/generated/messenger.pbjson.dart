///
//  Generated code. Do not modify.
//  source: messenger.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use sendFileRequestDescriptor instead')
const SendFileRequest$json = const {
  '1': 'SendFileRequest',
  '2': const [
    const {'1': 'fileName', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    const {'1': 'fileSource', '3': 2, '4': 1, '5': 9, '10': 'fileSource'},
    const {'1': 'fileContent', '3': 3, '4': 1, '5': 12, '10': 'fileContent'},
  ],
};

/// Descriptor for `SendFileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFileRequestDescriptor = $convert.base64Decode('Cg9TZW5kRmlsZVJlcXVlc3QSGgoIZmlsZU5hbWUYASABKAlSCGZpbGVOYW1lEh4KCmZpbGVTb3VyY2UYAiABKAlSCmZpbGVTb3VyY2USIAoLZmlsZUNvbnRlbnQYAyABKAxSC2ZpbGVDb250ZW50');
@$core.Deprecated('Use sendFileReplyDescriptor instead')
const SendFileReply$json = const {
  '1': 'SendFileReply',
  '2': const [
    const {'1': 'finishedFileSize', '3': 1, '4': 1, '5': 13, '10': 'finishedFileSize'},
  ],
};

/// Descriptor for `SendFileReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendFileReplyDescriptor = $convert.base64Decode('Cg1TZW5kRmlsZVJlcGx5EioKEGZpbmlzaGVkRmlsZVNpemUYASABKA1SEGZpbmlzaGVkRmlsZVNpemU=');
