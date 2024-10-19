// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_location_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddLocationRequest _$AddLocationRequestFromJson(Map<String, dynamic> json) {
  return _AddLocationRequest.fromJson(json);
}

/// @nodoc
mixin _$AddLocationRequest {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "width")
  int? get width => throw _privateConstructorUsedError;
  @JsonKey(name: "height")
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "imgDesc")
  String? get imgDesc => throw _privateConstructorUsedError;
  @JsonKey(name: "tag")
  String? get tag => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddLocationRequestCopyWith<AddLocationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddLocationRequestCopyWith<$Res> {
  factory $AddLocationRequestCopyWith(
          AddLocationRequest value, $Res Function(AddLocationRequest) then) =
      _$AddLocationRequestCopyWithImpl<$Res, AddLocationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "imgDesc") String? imgDesc,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class _$AddLocationRequestCopyWithImpl<$Res, $Val extends AddLocationRequest>
    implements $AddLocationRequestCopyWith<$Res> {
  _$AddLocationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? isActive = freezed,
    Object? imgDesc = freezed,
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
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
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddLocationRequestImplCopyWith<$Res>
    implements $AddLocationRequestCopyWith<$Res> {
  factory _$$AddLocationRequestImplCopyWith(_$AddLocationRequestImpl value,
          $Res Function(_$AddLocationRequestImpl) then) =
      __$$AddLocationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "width") int? width,
      @JsonKey(name: "height") int? height,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "imgDesc") String? imgDesc,
      @JsonKey(name: "tag") String? tag});
}

/// @nodoc
class __$$AddLocationRequestImplCopyWithImpl<$Res>
    extends _$AddLocationRequestCopyWithImpl<$Res, _$AddLocationRequestImpl>
    implements _$$AddLocationRequestImplCopyWith<$Res> {
  __$$AddLocationRequestImplCopyWithImpl(_$AddLocationRequestImpl _value,
      $Res Function(_$AddLocationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? isActive = freezed,
    Object? imgDesc = freezed,
    Object? tag = freezed,
  }) {
    return _then(_$AddLocationRequestImpl(
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
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
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
class _$AddLocationRequestImpl implements _AddLocationRequest {
  const _$AddLocationRequestImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "width") this.width,
      @JsonKey(name: "height") this.height,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "imgDesc") this.imgDesc,
      @JsonKey(name: "tag") this.tag});

  factory _$AddLocationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddLocationRequestImplFromJson(json);

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
  @JsonKey(name: "imgDesc")
  final String? imgDesc;
  @override
  @JsonKey(name: "tag")
  final String? tag;

  @override
  String toString() {
    return 'AddLocationRequest(name: $name, width: $width, height: $height, isActive: $isActive, imgDesc: $imgDesc, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddLocationRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.imgDesc, imgDesc) || other.imgDesc == imgDesc) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, width, height, isActive, imgDesc, tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddLocationRequestImplCopyWith<_$AddLocationRequestImpl> get copyWith =>
      __$$AddLocationRequestImplCopyWithImpl<_$AddLocationRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddLocationRequestImplToJson(
      this,
    );
  }
}

abstract class _AddLocationRequest implements AddLocationRequest {
  const factory _AddLocationRequest(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "width") final int? width,
      @JsonKey(name: "height") final int? height,
      @JsonKey(name: "isActive") final bool? isActive,
      @JsonKey(name: "imgDesc") final String? imgDesc,
      @JsonKey(name: "tag") final String? tag}) = _$AddLocationRequestImpl;

  factory _AddLocationRequest.fromJson(Map<String, dynamic> json) =
      _$AddLocationRequestImpl.fromJson;

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
  @JsonKey(name: "imgDesc")
  String? get imgDesc;
  @override
  @JsonKey(name: "tag")
  String? get tag;
  @override
  @JsonKey(ignore: true)
  _$$AddLocationRequestImplCopyWith<_$AddLocationRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
