// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdvertEntity _$AdvertEntityFromJson(Map<String, dynamic> json) {
  return _AdvertEntity.fromJson(json);
}

/// @nodoc
mixin _$AdvertEntity {
  @JsonKey(name: "advertID")
  int? get advertId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "descriptions")
  String? get descriptions => throw _privateConstructorUsedError;
  @JsonKey(name: "adsType")
  int? get adsType => throw _privateConstructorUsedError;
  @JsonKey(name: "openUrl")
  String? get openUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "startDate")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "endDate")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "sumView")
  int? get sumView => throw _privateConstructorUsedError;
  @JsonKey(name: "sumClick")
  int? get sumClick => throw _privateConstructorUsedError;
  @JsonKey(name: "isPublish")
  bool? get isPublish => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "tag")
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertEntityCopyWith<AdvertEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertEntityCopyWith<$Res> {
  factory $AdvertEntityCopyWith(
          AdvertEntity value, $Res Function(AdvertEntity) then) =
      _$AdvertEntityCopyWithImpl<$Res, AdvertEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "advertID") int? advertId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "descriptions") String? descriptions,
      @JsonKey(name: "adsType") int? adsType,
      @JsonKey(name: "openUrl") String? openUrl,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "sumView") int? sumView,
      @JsonKey(name: "sumClick") int? sumClick,
      @JsonKey(name: "isPublish") bool? isPublish,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class _$AdvertEntityCopyWithImpl<$Res, $Val extends AdvertEntity>
    implements $AdvertEntityCopyWith<$Res> {
  _$AdvertEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advertId = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? adsType = freezed,
    Object? openUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isActive = freezed,
    Object? url = freezed,
    Object? sumView = freezed,
    Object? sumClick = freezed,
    Object? isPublish = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      adsType: freezed == adsType
          ? _value.adsType
          : adsType // ignore: cast_nullable_to_non_nullable
              as int?,
      openUrl: freezed == openUrl
          ? _value.openUrl
          : openUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sumView: freezed == sumView
          ? _value.sumView
          : sumView // ignore: cast_nullable_to_non_nullable
              as int?,
      sumClick: freezed == sumClick
          ? _value.sumClick
          : sumClick // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvertEntityImplCopyWith<$Res>
    implements $AdvertEntityCopyWith<$Res> {
  factory _$$AdvertEntityImplCopyWith(
          _$AdvertEntityImpl value, $Res Function(_$AdvertEntityImpl) then) =
      __$$AdvertEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "advertID") int? advertId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "descriptions") String? descriptions,
      @JsonKey(name: "adsType") int? adsType,
      @JsonKey(name: "openUrl") String? openUrl,
      @JsonKey(name: "startDate") DateTime? startDate,
      @JsonKey(name: "endDate") DateTime? endDate,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "sumView") int? sumView,
      @JsonKey(name: "sumClick") int? sumClick,
      @JsonKey(name: "isPublish") bool? isPublish,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class __$$AdvertEntityImplCopyWithImpl<$Res>
    extends _$AdvertEntityCopyWithImpl<$Res, _$AdvertEntityImpl>
    implements _$$AdvertEntityImplCopyWith<$Res> {
  __$$AdvertEntityImplCopyWithImpl(
      _$AdvertEntityImpl _value, $Res Function(_$AdvertEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advertId = freezed,
    Object? name = freezed,
    Object? descriptions = freezed,
    Object? adsType = freezed,
    Object? openUrl = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isActive = freezed,
    Object? url = freezed,
    Object? sumView = freezed,
    Object? sumClick = freezed,
    Object? isPublish = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$AdvertEntityImpl(
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptions: freezed == descriptions
          ? _value.descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as String?,
      adsType: freezed == adsType
          ? _value.adsType
          : adsType // ignore: cast_nullable_to_non_nullable
              as int?,
      openUrl: freezed == openUrl
          ? _value.openUrl
          : openUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sumView: freezed == sumView
          ? _value.sumView
          : sumView // ignore: cast_nullable_to_non_nullable
              as int?,
      sumClick: freezed == sumClick
          ? _value.sumClick
          : sumClick // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublish: freezed == isPublish
          ? _value.isPublish
          : isPublish // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertEntityImpl extends _AdvertEntity {
  const _$AdvertEntityImpl(
      {@JsonKey(name: "advertID") this.advertId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "descriptions") this.descriptions,
      @JsonKey(name: "adsType") this.adsType,
      @JsonKey(name: "openUrl") this.openUrl,
      @JsonKey(name: "startDate") this.startDate,
      @JsonKey(name: "endDate") this.endDate,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "url") this.url,
      @JsonKey(name: "sumView") this.sumView,
      @JsonKey(name: "sumClick") this.sumClick,
      @JsonKey(name: "isPublish") this.isPublish,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "createdBy") this.createdBy,
      @JsonKey(name: "tag") this.tag})
      : super._();

  factory _$AdvertEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertEntityImplFromJson(json);

  @override
  @JsonKey(name: "advertID")
  final int? advertId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "descriptions")
  final String? descriptions;
  @override
  @JsonKey(name: "adsType")
  final int? adsType;
  @override
  @JsonKey(name: "openUrl")
  final String? openUrl;
  @override
  @JsonKey(name: "startDate")
  final DateTime? startDate;
  @override
  @JsonKey(name: "endDate")
  final DateTime? endDate;
  @override
  @JsonKey(name: "isActive")
  final bool? isActive;
  @override
  @JsonKey(name: "url")
  final String? url;
  @override
  @JsonKey(name: "sumView")
  final int? sumView;
  @override
  @JsonKey(name: "sumClick")
  final int? sumClick;
  @override
  @JsonKey(name: "isPublish")
  final bool? isPublish;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @override
  @JsonKey(name: "tag")
  final String? tag;

  @override
  String toString() {
    return 'AdvertEntity(advertId: $advertId, name: $name, descriptions: $descriptions, adsType: $adsType, openUrl: $openUrl, startDate: $startDate, endDate: $endDate, isActive: $isActive, url: $url, sumView: $sumView, sumClick: $sumClick, isPublish: $isPublish, createdAt: $createdAt, createdBy: $createdBy, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertEntityImpl &&
            (identical(other.advertId, advertId) ||
                other.advertId == advertId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.descriptions, descriptions) ||
                other.descriptions == descriptions) &&
            (identical(other.adsType, adsType) || other.adsType == adsType) &&
            (identical(other.openUrl, openUrl) || other.openUrl == openUrl) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sumView, sumView) || other.sumView == sumView) &&
            (identical(other.sumClick, sumClick) ||
                other.sumClick == sumClick) &&
            (identical(other.isPublish, isPublish) ||
                other.isPublish == isPublish) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      advertId,
      name,
      descriptions,
      adsType,
      openUrl,
      startDate,
      endDate,
      isActive,
      url,
      sumView,
      sumClick,
      isPublish,
      createdAt,
      createdBy,
      tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertEntityImplCopyWith<_$AdvertEntityImpl> get copyWith =>
      __$$AdvertEntityImplCopyWithImpl<_$AdvertEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertEntityImplToJson(
      this,
    );
  }
}

abstract class _AdvertEntity extends AdvertEntity {
  const factory _AdvertEntity(
      {@JsonKey(name: "advertID") final int? advertId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "descriptions") final String? descriptions,
      @JsonKey(name: "adsType") final int? adsType,
      @JsonKey(name: "openUrl") final String? openUrl,
      @JsonKey(name: "startDate") final DateTime? startDate,
      @JsonKey(name: "endDate") final DateTime? endDate,
      @JsonKey(name: "isActive") final bool? isActive,
      @JsonKey(name: "url") final String? url,
      @JsonKey(name: "sumView") final int? sumView,
      @JsonKey(name: "sumClick") final int? sumClick,
      @JsonKey(name: "isPublish") final bool? isPublish,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "createdBy") final String? createdBy,
      @JsonKey(name: "tag") final String? tag}) = _$AdvertEntityImpl;
  const _AdvertEntity._() : super._();

  factory _AdvertEntity.fromJson(Map<String, dynamic> json) =
      _$AdvertEntityImpl.fromJson;

  @override
  @JsonKey(name: "advertID")
  int? get advertId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "descriptions")
  String? get descriptions;
  @override
  @JsonKey(name: "adsType")
  int? get adsType;
  @override
  @JsonKey(name: "openUrl")
  String? get openUrl;
  @override
  @JsonKey(name: "startDate")
  DateTime? get startDate;
  @override
  @JsonKey(name: "endDate")
  DateTime? get endDate;
  @override
  @JsonKey(name: "isActive")
  bool? get isActive;
  @override
  @JsonKey(name: "url")
  String? get url;
  @override
  @JsonKey(name: "sumView")
  int? get sumView;
  @override
  @JsonKey(name: "sumClick")
  int? get sumClick;
  @override
  @JsonKey(name: "isPublish")
  bool? get isPublish;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "createdBy")
  String? get createdBy;
  @override
  @JsonKey(name: "tag")
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$AdvertEntityImplCopyWith<_$AdvertEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
