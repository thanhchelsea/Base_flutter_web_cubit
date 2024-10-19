// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  @JsonKey(name: "locationID")
  int? get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "createdBy")
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "createdAt")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "imgDesc")
  String? get imgDesc => throw _privateConstructorUsedError;
  @JsonKey(name: "sumView")
  int? get sumView => throw _privateConstructorUsedError;
  @JsonKey(name: "sumClick")
  int? get sumClick => throw _privateConstructorUsedError;
  @JsonKey(name: "tag")
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "locationID") int? locationId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "imgDesc") String? imgDesc,
      @JsonKey(name: "sumView") int? sumView,
      @JsonKey(name: "sumClick") int? sumClick,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = freezed,
    Object? name = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? imgDesc = freezed,
    Object? sumView = freezed,
    Object? sumClick = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      sumView: freezed == sumView
          ? _value.sumView
          : sumView // ignore: cast_nullable_to_non_nullable
              as int?,
      sumClick: freezed == sumClick
          ? _value.sumClick
          : sumClick // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "locationID") int? locationId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "createdBy") String? createdBy,
      @JsonKey(name: "createdAt") DateTime? createdAt,
      @JsonKey(name: "imgDesc") String? imgDesc,
      @JsonKey(name: "sumView") int? sumView,
      @JsonKey(name: "sumClick") int? sumClick,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = freezed,
    Object? name = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? imgDesc = freezed,
    Object? sumView = freezed,
    Object? sumClick = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$LocationModelImpl(
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      sumView: freezed == sumView
          ? _value.sumView
          : sumView // ignore: cast_nullable_to_non_nullable
              as int?,
      sumClick: freezed == sumClick
          ? _value.sumClick
          : sumClick // ignore: cast_nullable_to_non_nullable
              as int?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationModelImpl implements _LocationModel {
  const _$LocationModelImpl(
      {@JsonKey(name: "locationID") this.locationId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "width") this.width,
      @JsonKey(name: "height") this.height,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "createdBy") this.createdBy,
      @JsonKey(name: "createdAt") this.createdAt,
      @JsonKey(name: "imgDesc") this.imgDesc,
      @JsonKey(name: "sumView") this.sumView,
      @JsonKey(name: "sumClick") this.sumClick,
      @JsonKey(name: "tag") this.tag});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  @JsonKey(name: "locationID")
  final int? locationId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "width")
  final int? width;
  @override
  @JsonKey(name: "height")
  final int? height;
  @override
  @JsonKey(name: "isActive")
  final bool? isActive;
  @override
  @JsonKey(name: "createdBy")
  final String? createdBy;
  @override
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "imgDesc")
  final String? imgDesc;
  @override
  @JsonKey(name: "sumView")
  final int? sumView;
  @override
  @JsonKey(name: "sumClick")
  final int? sumClick;
  @override
  @JsonKey(name: "tag")
  final String? tag;

  @override
  String toString() {
    return 'LocationModel(locationId: $locationId, name: $name, width: $width, height: $height, isActive: $isActive, createdBy: $createdBy, createdAt: $createdAt, imgDesc: $imgDesc, sumView: $sumView, sumClick: $sumClick, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.imgDesc, imgDesc) || other.imgDesc == imgDesc) &&
            (identical(other.sumView, sumView) || other.sumView == sumView) &&
            (identical(other.sumClick, sumClick) ||
                other.sumClick == sumClick) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, locationId, name, width, height,
      isActive, createdBy, createdAt, imgDesc, sumView, sumClick, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {@JsonKey(name: "locationID") final int? locationId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "width") final int? width,
      @JsonKey(name: "height") final int? height,
      @JsonKey(name: "isActive") final bool? isActive,
      @JsonKey(name: "createdBy") final String? createdBy,
      @JsonKey(name: "createdAt") final DateTime? createdAt,
      @JsonKey(name: "imgDesc") final String? imgDesc,
      @JsonKey(name: "sumView") final int? sumView,
      @JsonKey(name: "sumClick") final int? sumClick,
      @JsonKey(name: "tag") final String? tag}) = _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  @JsonKey(name: "locationID")
  int? get locationId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "width")
  int? get width;
  @override
  @JsonKey(name: "height")
  int? get height;
  @override
  @JsonKey(name: "isActive")
  bool? get isActive;
  @override
  @JsonKey(name: "createdBy")
  String? get createdBy;
  @override
  @JsonKey(name: "createdAt")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "imgDesc")
  String? get imgDesc;
  @override
  @JsonKey(name: "sumView")
  int? get sumView;
  @override
  @JsonKey(name: "sumClick")
  int? get sumClick;
  @override
  @JsonKey(name: "tag")
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}