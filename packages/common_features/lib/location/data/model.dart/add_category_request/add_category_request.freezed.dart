// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddCategoryRequest _$AddCategoryRequestFromJson(Map<String, dynamic> json) {
  return _AddCategoryRequest.fromJson(json);
}

/// @nodoc
mixin _$AddCategoryRequest {
  @JsonKey(name: "catID")
  int? get catId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "isActive")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "route")
  String? get route => throw _privateConstructorUsedError;
  @JsonKey(name: "imgDesc")
  String? get imgDesc => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddCategoryRequestCopyWith<AddCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryRequestCopyWith<$Res> {
  factory $AddCategoryRequestCopyWith(
          AddCategoryRequest value, $Res Function(AddCategoryRequest) then) =
      _$AddCategoryRequestCopyWithImpl<$Res, AddCategoryRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "catID") int? catId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "route") String? route,
      @JsonKey(name: "imgDesc") String? imgDesc});
}

/// @nodoc
class _$AddCategoryRequestCopyWithImpl<$Res, $Val extends AddCategoryRequest>
    implements $AddCategoryRequestCopyWith<$Res> {
  _$AddCategoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catId = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? route = freezed,
    Object? imgDesc = freezed,
  }) {
    return _then(_value.copyWith(
      catId: freezed == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCategoryRequestImplCopyWith<$Res>
    implements $AddCategoryRequestCopyWith<$Res> {
  factory _$$AddCategoryRequestImplCopyWith(_$AddCategoryRequestImpl value,
          $Res Function(_$AddCategoryRequestImpl) then) =
      __$$AddCategoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "catID") int? catId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "isActive") bool? isActive,
      @JsonKey(name: "route") String? route,
      @JsonKey(name: "imgDesc") String? imgDesc});
}

/// @nodoc
class __$$AddCategoryRequestImplCopyWithImpl<$Res>
    extends _$AddCategoryRequestCopyWithImpl<$Res, _$AddCategoryRequestImpl>
    implements _$$AddCategoryRequestImplCopyWith<$Res> {
  __$$AddCategoryRequestImplCopyWithImpl(_$AddCategoryRequestImpl _value,
      $Res Function(_$AddCategoryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catId = freezed,
    Object? name = freezed,
    Object? isActive = freezed,
    Object? route = freezed,
    Object? imgDesc = freezed,
  }) {
    return _then(_$AddCategoryRequestImpl(
      catId: freezed == catId
          ? _value.catId
          : catId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      route: freezed == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String?,
      imgDesc: freezed == imgDesc
          ? _value.imgDesc
          : imgDesc // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddCategoryRequestImpl implements _AddCategoryRequest {
  const _$AddCategoryRequestImpl(
      {@JsonKey(name: "catID") this.catId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "isActive") this.isActive,
      @JsonKey(name: "route") this.route,
      @JsonKey(name: "imgDesc") this.imgDesc});

  factory _$AddCategoryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddCategoryRequestImplFromJson(json);

  @override
  @JsonKey(name: "catID")
  final int? catId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "isActive")
  final bool? isActive;
  @override
  @JsonKey(name: "route")
  final String? route;
  @override
  @JsonKey(name: "imgDesc")
  final String? imgDesc;

  @override
  String toString() {
    return 'AddCategoryRequest(catId: $catId, name: $name, isActive: $isActive, route: $route, imgDesc: $imgDesc)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryRequestImpl &&
            (identical(other.catId, catId) || other.catId == catId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.imgDesc, imgDesc) || other.imgDesc == imgDesc));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, catId, name, isActive, route, imgDesc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryRequestImplCopyWith<_$AddCategoryRequestImpl> get copyWith =>
      __$$AddCategoryRequestImplCopyWithImpl<_$AddCategoryRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddCategoryRequestImplToJson(
      this,
    );
  }
}

abstract class _AddCategoryRequest implements AddCategoryRequest {
  const factory _AddCategoryRequest(
          {@JsonKey(name: "catID") final int? catId,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "isActive") final bool? isActive,
          @JsonKey(name: "route") final String? route,
          @JsonKey(name: "imgDesc") final String? imgDesc}) =
      _$AddCategoryRequestImpl;

  factory _AddCategoryRequest.fromJson(Map<String, dynamic> json) =
      _$AddCategoryRequestImpl.fromJson;

  @override
  @JsonKey(name: "catID")
  int? get catId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "isActive")
  bool? get isActive;
  @override
  @JsonKey(name: "route")
  String? get route;
  @override
  @JsonKey(name: "imgDesc")
  String? get imgDesc;
  @override
  @JsonKey(ignore: true)
  _$$AddCategoryRequestImplCopyWith<_$AddCategoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
