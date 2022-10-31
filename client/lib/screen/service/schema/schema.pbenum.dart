///
//  Generated code. Do not modify.
//  source: schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NewsType extends $pb.ProtobufEnum {
  static const NewsType article = NewsType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'article');
  static const NewsType media = NewsType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'media');

  static const $core.List<NewsType> values = <NewsType> [
    article,
    media,
  ];

  static final $core.Map<$core.int, NewsType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NewsType? valueOf($core.int value) => _byValue[value];

  const NewsType._($core.int v, $core.String n) : super(v, n);
}

class MediaPost_Type extends $pb.ProtobufEnum {
  static const MediaPost_Type YOUTUBE = MediaPost_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'YOUTUBE');
  static const MediaPost_Type AUDIO = MediaPost_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUDIO');
  static const MediaPost_Type VIDEO = MediaPost_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<MediaPost_Type> values = <MediaPost_Type> [
    YOUTUBE,
    AUDIO,
    VIDEO,
  ];

  static final $core.Map<$core.int, MediaPost_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaPost_Type? valueOf($core.int value) => _byValue[value];

  const MediaPost_Type._($core.int v, $core.String n) : super(v, n);
}

