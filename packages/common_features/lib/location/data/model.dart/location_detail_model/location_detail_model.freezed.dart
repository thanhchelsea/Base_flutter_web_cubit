// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationDetailModel _$LocationDetailModelFromJson(Map<String, dynamic> json) {
  return _LocationDetailModel.fromJson(json);
}

/// @nodoc
mixin _$LocationDetailModel {
  @JsonKey(name: "location")
  LocationModel? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "categories")
  List<CategoryModel>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDetailModelCopyWith<LocationDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDetailModelCopyWith<$Res> {
  factory $LocationDetailModelCopyWith(
          LocationDetailModel value, $Res Function(LocationDetailModel) then) =
      _$LocationDetailModelCopyWithImpl<$Res, LocationDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "location") LocationModel? location,
      @JsonKey(name: "categories") List<CategoryModel>? categories});

  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$LocationDetailModelCopyWithImpl<$Res, $Val extends LocationDetailModel>
    implements $LocationDetailModelCopyWith<$Res> {
  _$LocationDetailModelCopyWithImpl(this._value, this._then);

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
              as LocationModel?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationDetailModelImplCopyWith<$Res>
    implements $LocationDetailModelCopyWith<$Res> {
  factory _$$LocationDetailModelImplCopyWith(_$LocationDetailModelImpl value,
          $Res Function(_$LocationDetailModelImpl) then) =
      __$$LocationDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "location") LocationModel? location,
      @JsonKey(name: "categories") List<CategoryModel>? categories});

  @override
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$LocationDetailModelImplCopyWithImpl<$Res>
    extends _$LocationDetailModelCopyWithImpl<$Res, _$LocationDetailModelImpl>
    implements _$$LocationDetailModelImplCopyWith<$Res> {
  __$$LocationDetailModelImplCopyWithImpl(_$LocationDetailModelImpl _value,
      $Res Function(_$LocationDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$LocationDetailModelImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDetailModelImpl implements _LocationDetailModel {
  const _$LocationDetailModelImpl(
      {@JsonKey(name: "location") this.location,
      @JsonKey(name: "categories") final List<CategoryModel>? categories})
      : _categories = categories;

  factory _$LocationDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "location")
  final LocationModel? location;
  final List<CategoryModel>? _categories;
  @override
  @JsonKey(name: "categories")
  List<CategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LocationDetailModel(location: $location, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDetailModelImpl &&
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
  _$$LocationDetailModelImplCopyWith<_$LocationDetailModelImpl> get copyWith =>
      __$$LocationDetailModelImplCopyWithImpl<_$LocationDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDetailModelImplToJson(
      this,
    );
  }
}

abstract class _LocationDetailModel implements LocationDetailModel {
  const factory _LocationDetailModel(
          {@JsonKey(name: "location") final LocationModel? location,
          @JsonKey(name: "categories") final List<CategoryModel>? categories}) =
      _$LocationDetailModelImpl;

  factory _LocationDetailModel.fromJson(Map<String, dynamic> json) =
      _$LocationDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "location")
  LocationModel? get location;
  @override
  @JsonKey(name: "categories")
  List<CategoryModel>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$LocationDetailModelImplCopyWith<_$LocationDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
