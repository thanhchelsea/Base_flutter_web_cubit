// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdvertDetailEntity _$AdvertDetailEntityFromJson(Map<String, dynamic> json) {
  return _AdvertDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$AdvertDetailEntity {
  @JsonKey(name: "advert")
  AdvertEntity? get advert => throw _privateConstructorUsedError;
  @JsonKey(name: "locations")
  List<LocationEntity>? get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertDetailEntityCopyWith<AdvertDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertDetailEntityCopyWith<$Res> {
  factory $AdvertDetailEntityCopyWith(
          AdvertDetailEntity value, $Res Function(AdvertDetailEntity) then) =
      _$AdvertDetailEntityCopyWithImpl<$Res, AdvertDetailEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "advert") AdvertEntity? advert,
      @JsonKey(name: "locations") List<LocationEntity>? locations});

  $AdvertEntityCopyWith<$Res>? get advert;
}

/// @nodoc
class _$AdvertDetailEntityCopyWithImpl<$Res, $Val extends AdvertDetailEntity>
    implements $AdvertDetailEntityCopyWith<$Res> {
  _$AdvertDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advert = freezed,
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      advert: freezed == advert
          ? _value.advert
          : advert // ignore: cast_nullable_to_non_nullable
              as AdvertEntity?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationEntity>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdvertEntityCopyWith<$Res>? get advert {
    if (_value.advert == null) {
      return null;
    }

    return $AdvertEntityCopyWith<$Res>(_value.advert!, (value) {
      return _then(_value.copyWith(advert: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdvertDetailEntityImplCopyWith<$Res>
    implements $AdvertDetailEntityCopyWith<$Res> {
  factory _$$AdvertDetailEntityImplCopyWith(_$AdvertDetailEntityImpl value,
          $Res Function(_$AdvertDetailEntityImpl) then) =
      __$$AdvertDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "advert") AdvertEntity? advert,
      @JsonKey(name: "locations") List<LocationEntity>? locations});

  @override
  $AdvertEntityCopyWith<$Res>? get advert;
}

/// @nodoc
class __$$AdvertDetailEntityImplCopyWithImpl<$Res>
    extends _$AdvertDetailEntityCopyWithImpl<$Res, _$AdvertDetailEntityImpl>
    implements _$$AdvertDetailEntityImplCopyWith<$Res> {
  __$$AdvertDetailEntityImplCopyWithImpl(_$AdvertDetailEntityImpl _value,
      $Res Function(_$AdvertDetailEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advert = freezed,
    Object? locations = freezed,
  }) {
    return _then(_$AdvertDetailEntityImpl(
      advert: freezed == advert
          ? _value.advert
          : advert // ignore: cast_nullable_to_non_nullable
              as AdvertEntity?,
      locations: freezed == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertDetailEntityImpl implements _AdvertDetailEntity {
  const _$AdvertDetailEntityImpl(
      {@JsonKey(name: "advert") this.advert,
      @JsonKey(name: "locations") final List<LocationEntity>? locations})
      : _locations = locations;

  factory _$AdvertDetailEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertDetailEntityImplFromJson(json);

  @override
  @JsonKey(name: "advert")
  final AdvertEntity? advert;
  final List<LocationEntity>? _locations;
  @override
  @JsonKey(name: "locations")
  List<LocationEntity>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdvertDetailEntity(advert: $advert, locations: $locations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertDetailEntityImpl &&
            (identical(other.advert, advert) || other.advert == advert) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, advert, const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertDetailEntityImplCopyWith<_$AdvertDetailEntityImpl> get copyWith =>
      __$$AdvertDetailEntityImplCopyWithImpl<_$AdvertDetailEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertDetailEntityImplToJson(
      this,
    );
  }
}

abstract class _AdvertDetailEntity implements AdvertDetailEntity {
  const factory _AdvertDetailEntity(
          {@JsonKey(name: "advert") final AdvertEntity? advert,
          @JsonKey(name: "locations") final List<LocationEntity>? locations}) =
      _$AdvertDetailEntityImpl;

  factory _AdvertDetailEntity.fromJson(Map<String, dynamic> json) =
      _$AdvertDetailEntityImpl.fromJson;

  @override
  @JsonKey(name: "advert")
  AdvertEntity? get advert;
  @override
  @JsonKey(name: "locations")
  List<LocationEntity>? get locations;
  @override
  @JsonKey(ignore: true)
  _$$AdvertDetailEntityImplCopyWith<_$AdvertDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
