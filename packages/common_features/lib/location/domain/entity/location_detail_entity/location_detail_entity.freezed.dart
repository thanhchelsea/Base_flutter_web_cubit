// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationDetailEntity _$LocationDetailEntityFromJson(Map<String, dynamic> json) {
  return _LocationDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$LocationDetailEntity {
  @JsonKey(name: "location")
  LocationEntity? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "categories")
  List<CategoryEntity>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDetailEntityCopyWith<LocationDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDetailEntityCopyWith<$Res> {
  factory $LocationDetailEntityCopyWith(LocationDetailEntity value,
          $Res Function(LocationDetailEntity) then) =
      _$LocationDetailEntityCopyWithImpl<$Res, LocationDetailEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "location") LocationEntity? location,
      @JsonKey(name: "categories") List<CategoryEntity>? categories});

  $LocationEntityCopyWith<$Res>? get location;
}

/// @nodoc
class _$LocationDetailEntityCopyWithImpl<$Res,
        $Val extends LocationDetailEntity>
    implements $LocationDetailEntityCopyWith<$Res> {
  _$LocationDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationEntityCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationEntityCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationDetailEntityImplCopyWith<$Res>
    implements $LocationDetailEntityCopyWith<$Res> {
  factory _$$LocationDetailEntityImplCopyWith(_$LocationDetailEntityImpl value,
          $Res Function(_$LocationDetailEntityImpl) then) =
      __$$LocationDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "location") LocationEntity? location,
      @JsonKey(name: "categories") List<CategoryEntity>? categories});

  @override
  $LocationEntityCopyWith<$Res>? get location;
}

/// @nodoc
class __$$LocationDetailEntityImplCopyWithImpl<$Res>
    extends _$LocationDetailEntityCopyWithImpl<$Res, _$LocationDetailEntityImpl>
    implements _$$LocationDetailEntityImplCopyWith<$Res> {
  __$$LocationDetailEntityImplCopyWithImpl(_$LocationDetailEntityImpl _value,
      $Res Function(_$LocationDetailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$LocationDetailEntityImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationEntity?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDetailEntityImpl implements _LocationDetailEntity {
  const _$LocationDetailEntityImpl(
      {@JsonKey(name: "location") this.location,
      @JsonKey(name: "categories") final List<CategoryEntity>? categories})
      : _categories = categories;

  factory _$LocationDetailEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDetailEntityImplFromJson(json);

  @override
  @JsonKey(name: "location")
  final LocationEntity? location;
  final List<CategoryEntity>? _categories;
  @override
  @JsonKey(name: "categories")
  List<CategoryEntity>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationDetailEntity(location: $location, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDetailEntityImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, location, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDetailEntityImplCopyWith<_$LocationDetailEntityImpl>
      get copyWith =>
          __$$LocationDetailEntityImplCopyWithImpl<_$LocationDetailEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDetailEntityImplToJson(
      this,
    );
  }
}

abstract class _LocationDetailEntity implements LocationDetailEntity {
  const factory _LocationDetailEntity(
      {@JsonKey(name: "location") final LocationEntity? location,
      @JsonKey(name: "categories")
      final List<CategoryEntity>? categories}) = _$LocationDetailEntityImpl;

  factory _LocationDetailEntity.fromJson(Map<String, dynamic> json) =
      _$LocationDetailEntityImpl.fromJson;

  @override
  @JsonKey(name: "location")
  LocationEntity? get location;
  @override
  @JsonKey(name: "categories")
  List<CategoryEntity>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$LocationDetailEntityImplCopyWith<_$LocationDetailEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
