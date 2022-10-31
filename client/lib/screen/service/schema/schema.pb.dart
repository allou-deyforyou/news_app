///
//  Generated code. Do not modify.
//  source: schema.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;

import 'schema.pbenum.dart';

export 'schema.pbenum.dart';

class ArticlePost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticlePost', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image')
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', subBuilder: $0.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logo')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  ArticlePost._() : super();
  factory ArticlePost({
    $core.String? title,
    $core.String? image,
    $0.Timestamp? date,
    $core.String? link,
    $core.String? content,
    $core.String? source,
    $core.String? logo,
    $core.String? description,
  }) {
    final result = create();
    if (title != null) {
      result.title = title;
    }
    if (image != null) {
      result.image = image;
    }
    if (date != null) {
      result.date = date;
    }
    if (link != null) {
      result.link = link;
    }
    if (content != null) {
      result.content = content;
    }
    if (source != null) {
      result.source = source;
    }
    if (logo != null) {
      result.logo = logo;
    }
    if (description != null) {
      result.description = description;
    }
    return result;
  }
  factory ArticlePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePost clone() => ArticlePost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePost copyWith(void Function(ArticlePost) updates) => super.copyWith((message) => updates(message as ArticlePost)) as ArticlePost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticlePost create() => ArticlePost._();
  ArticlePost createEmptyInstance() => create();
  static $pb.PbList<ArticlePost> createRepeated() => $pb.PbList<ArticlePost>();
  @$core.pragma('dart2js:noInline')
  static ArticlePost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePost>(create);
  static ArticlePost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get date => $_getN(2);
  @$pb.TagNumber(3)
  set date($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get link => $_getSZ(3);
  @$pb.TagNumber(4)
  set link($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get source => $_getSZ(5);
  @$pb.TagNumber(6)
  set source($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSource() => $_has(5);
  @$pb.TagNumber(6)
  void clearSource() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get logo => $_getSZ(6);
  @$pb.TagNumber(7)
  set logo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLogo() => $_has(6);
  @$pb.TagNumber(7)
  void clearLogo() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);
}

class ArticlePostRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticlePostRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'language')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'country')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'page')
    ..hasRequiredFields = false
  ;

  ArticlePostRequest._() : super();
  factory ArticlePostRequest({
    $core.String? language,
    $core.String? category,
    $core.String? country,
    $core.String? source,
    $core.String? query,
    $fixnum.Int64? page,
  }) {
    final result = create();
    if (language != null) {
      result.language = language;
    }
    if (category != null) {
      result.category = category;
    }
    if (country != null) {
      result.country = country;
    }
    if (source != null) {
      result.source = source;
    }
    if (query != null) {
      result.query = query;
    }
    if (page != null) {
      result.page = page;
    }
    return result;
  }
  factory ArticlePostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePostRequest clone() => ArticlePostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePostRequest copyWith(void Function(ArticlePostRequest) updates) => super.copyWith((message) => updates(message as ArticlePostRequest)) as ArticlePostRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticlePostRequest create() => ArticlePostRequest._();
  ArticlePostRequest createEmptyInstance() => create();
  static $pb.PbList<ArticlePostRequest> createRepeated() => $pb.PbList<ArticlePostRequest>();
  @$core.pragma('dart2js:noInline')
  static ArticlePostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePostRequest>(create);
  static ArticlePostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get category => $_getSZ(1);
  @$pb.TagNumber(2)
  set category($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategory() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategory() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get country => $_getSZ(2);
  @$pb.TagNumber(3)
  set country($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCountry() => $_has(2);
  @$pb.TagNumber(3)
  void clearCountry() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(4)
  set source($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get query => $_getSZ(4);
  @$pb.TagNumber(5)
  set query($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuery() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuery() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get page => $_getI64(5);
  @$pb.TagNumber(6)
  set page($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPage() => $_has(5);
  @$pb.TagNumber(6)
  void clearPage() => clearField(6);
}

class ArticlePostListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticlePostListResponse', createEmptyInstance: create)
    ..pc<ArticlePost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: ArticlePost.create)
    ..hasRequiredFields = false
  ;

  ArticlePostListResponse._() : super();
  factory ArticlePostListResponse({
    $core.Iterable<ArticlePost>? data,
  }) {
    final result = create();
    if (data != null) {
      result.data.addAll(data);
    }
    return result;
  }
  factory ArticlePostListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePostListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePostListResponse clone() => ArticlePostListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePostListResponse copyWith(void Function(ArticlePostListResponse) updates) => super.copyWith((message) => updates(message as ArticlePostListResponse)) as ArticlePostListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticlePostListResponse create() => ArticlePostListResponse._();
  ArticlePostListResponse createEmptyInstance() => create();
  static $pb.PbList<ArticlePostListResponse> createRepeated() => $pb.PbList<ArticlePostListResponse>();
  @$core.pragma('dart2js:noInline')
  static ArticlePostListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePostListResponse>(create);
  static ArticlePostListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ArticlePost> get data => $_getList(0);
}

class ArticlePostResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ArticlePostResponse', createEmptyInstance: create)
    ..aOM<ArticlePost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: ArticlePost.create)
    ..hasRequiredFields = false
  ;

  ArticlePostResponse._() : super();
  factory ArticlePostResponse({
    ArticlePost? data,
  }) {
    final result = create();
    if (data != null) {
      result.data = data;
    }
    return result;
  }
  factory ArticlePostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePostResponse clone() => ArticlePostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePostResponse copyWith(void Function(ArticlePostResponse) updates) => super.copyWith((message) => updates(message as ArticlePostResponse)) as ArticlePostResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ArticlePostResponse create() => ArticlePostResponse._();
  ArticlePostResponse createEmptyInstance() => create();
  static $pb.PbList<ArticlePostResponse> createRepeated() => $pb.PbList<ArticlePostResponse>();
  @$core.pragma('dart2js:noInline')
  static ArticlePostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePostResponse>(create);
  static ArticlePostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ArticlePost get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(ArticlePost v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  ArticlePost ensureData() => $_ensure(0);
}

class MediaPost extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MediaPost', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image')
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'date', subBuilder: $0.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'source')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logo')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOB(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'live')
    ..e<MediaPost_Type>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MediaPost_Type.YOUTUBE, valueOf: MediaPost_Type.valueOf, enumValues: MediaPost_Type.values)
    ..hasRequiredFields = false
  ;

  MediaPost._() : super();
  factory MediaPost({
    $core.String? title,
    $core.String? image,
    $0.Timestamp? date,
    $core.String? link,
    $core.String? content,
    $core.String? source,
    $core.String? logo,
    $core.String? description,
    $core.bool? live,
    MediaPost_Type? type,
  }) {
    final result = create();
    if (title != null) {
      result.title = title;
    }
    if (image != null) {
      result.image = image;
    }
    if (date != null) {
      result.date = date;
    }
    if (link != null) {
      result.link = link;
    }
    if (content != null) {
      result.content = content;
    }
    if (source != null) {
      result.source = source;
    }
    if (logo != null) {
      result.logo = logo;
    }
    if (description != null) {
      result.description = description;
    }
    if (live != null) {
      result.live = live;
    }
    if (type != null) {
      result.type = type;
    }
    return result;
  }
  factory MediaPost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaPost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaPost clone() => MediaPost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaPost copyWith(void Function(MediaPost) updates) => super.copyWith((message) => updates(message as MediaPost)) as MediaPost; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MediaPost create() => MediaPost._();
  MediaPost createEmptyInstance() => create();
  static $pb.PbList<MediaPost> createRepeated() => $pb.PbList<MediaPost>();
  @$core.pragma('dart2js:noInline')
  static MediaPost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaPost>(create);
  static MediaPost? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(2)
  set image($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get date => $_getN(2);
  @$pb.TagNumber(3)
  set date($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDate() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get link => $_getSZ(3);
  @$pb.TagNumber(4)
  set link($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLink() => $_has(3);
  @$pb.TagNumber(4)
  void clearLink() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get source => $_getSZ(5);
  @$pb.TagNumber(6)
  set source($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSource() => $_has(5);
  @$pb.TagNumber(6)
  void clearSource() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get logo => $_getSZ(6);
  @$pb.TagNumber(7)
  set logo($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLogo() => $_has(6);
  @$pb.TagNumber(7)
  void clearLogo() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get live => $_getBF(8);
  @$pb.TagNumber(9)
  set live($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLive() => $_has(8);
  @$pb.TagNumber(9)
  void clearLive() => clearField(9);

  @$pb.TagNumber(10)
  MediaPost_Type get type => $_getN(9);
  @$pb.TagNumber(10)
  set type(MediaPost_Type v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasType() => $_has(9);
  @$pb.TagNumber(10)
  void clearType() => clearField(10);
}

class MediaPostListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MediaPostListResponse', createEmptyInstance: create)
    ..pc<MediaPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: MediaPost.create)
    ..hasRequiredFields = false
  ;

  MediaPostListResponse._() : super();
  factory MediaPostListResponse({
    $core.Iterable<MediaPost>? data,
  }) {
    final result = create();
    if (data != null) {
      result.data.addAll(data);
    }
    return result;
  }
  factory MediaPostListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaPostListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaPostListResponse clone() => MediaPostListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaPostListResponse copyWith(void Function(MediaPostListResponse) updates) => super.copyWith((message) => updates(message as MediaPostListResponse)) as MediaPostListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MediaPostListResponse create() => MediaPostListResponse._();
  MediaPostListResponse createEmptyInstance() => create();
  static $pb.PbList<MediaPostListResponse> createRepeated() => $pb.PbList<MediaPostListResponse>();
  @$core.pragma('dart2js:noInline')
  static MediaPostListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaPostListResponse>(create);
  static MediaPostListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<MediaPost> get data => $_getList(0);
}

class MediaPostResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MediaPostResponse', createEmptyInstance: create)
    ..aOM<MediaPost>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: MediaPost.create)
    ..hasRequiredFields = false
  ;

  MediaPostResponse._() : super();
  factory MediaPostResponse({
    MediaPost? data,
  }) {
    final result = create();
    if (data != null) {
      result.data = data;
    }
    return result;
  }
  factory MediaPostResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MediaPostResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MediaPostResponse clone() => MediaPostResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MediaPostResponse copyWith(void Function(MediaPostResponse) updates) => super.copyWith((message) => updates(message as MediaPostResponse)) as MediaPostResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MediaPostResponse create() => MediaPostResponse._();
  MediaPostResponse createEmptyInstance() => create();
  static $pb.PbList<MediaPostResponse> createRepeated() => $pb.PbList<MediaPostResponse>();
  @$core.pragma('dart2js:noInline')
  static MediaPostResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MediaPostResponse>(create);
  static MediaPostResponse? _defaultInstance;

  @$pb.TagNumber(1)
  MediaPost get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(MediaPost v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  MediaPost ensureData() => $_ensure(0);
}

class NewsCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewsCategory', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  NewsCategory._() : super();
  factory NewsCategory({
    $core.String? value,
    $core.String? name,
  }) {
    final result = create();
    if (value != null) {
      result.value = value;
    }
    if (name != null) {
      result.name = name;
    }
    return result;
  }
  factory NewsCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewsCategory clone() => NewsCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsCategory copyWith(void Function(NewsCategory) updates) => super.copyWith((message) => updates(message as NewsCategory)) as NewsCategory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewsCategory create() => NewsCategory._();
  NewsCategory createEmptyInstance() => create();
  static $pb.PbList<NewsCategory> createRepeated() => $pb.PbList<NewsCategory>();
  @$core.pragma('dart2js:noInline')
  static NewsCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsCategory>(create);
  static NewsCategory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class NewsCategoryListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NewsCategoryListResponse', createEmptyInstance: create)
    ..pc<NewsCategory>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: NewsCategory.create)
    ..hasRequiredFields = false
  ;

  NewsCategoryListResponse._() : super();
  factory NewsCategoryListResponse({
    $core.Iterable<NewsCategory>? data,
  }) {
    final result = create();
    if (data != null) {
      result.data.addAll(data);
    }
    return result;
  }
  factory NewsCategoryListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsCategoryListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewsCategoryListResponse clone() => NewsCategoryListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsCategoryListResponse copyWith(void Function(NewsCategoryListResponse) updates) => super.copyWith((message) => updates(message as NewsCategoryListResponse)) as NewsCategoryListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NewsCategoryListResponse create() => NewsCategoryListResponse._();
  NewsCategoryListResponse createEmptyInstance() => create();
  static $pb.PbList<NewsCategoryListResponse> createRepeated() => $pb.PbList<NewsCategoryListResponse>();
  @$core.pragma('dart2js:noInline')
  static NewsCategoryListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsCategoryListResponse>(create);
  static NewsCategoryListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewsCategory> get data => $_getList(0);
}

