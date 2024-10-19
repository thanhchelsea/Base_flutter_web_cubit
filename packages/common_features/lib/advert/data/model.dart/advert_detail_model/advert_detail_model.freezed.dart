// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdvertDetailModel _$AdvertDetailModelFromJson(Map<String, dynamic> json) {
  return _AdvertDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AdvertDetailModel {
  @JsonKey(name: "advert")
  AdvertModel? get advert => throw _privateConstructorUsedError;
  @JsonKey(name: "locations")
  List<LocationModel>? get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertDetailModelCopyWith<AdvertDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertDetailModelCopyWith<$Res> {
  factory $AdvertDetailModelCopyWith(
          AdvertDetailModel value, $Res Function(AdvertDetailModel) then) =
      _$AdvertDetailModelCopyWithImpl<$Res, AdvertDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "advert") AdvertModel? advert,
      @JsonKey(name: "locations") List<LocationModel>? locations});

  $AdvertModelCopyWith<$Res>? get advert;
}

/// @nodoc
class _$AdvertDetailModelCopyWithImpl<$Res, $Val extends AdvertDetailModel>
    implements $AdvertDetailModelCopyWith<$Res> {
  _$AdvertDetailModelCopyWithImpl(this._value, this._then);

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
              as AdvertModel?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdvertModelCopyWith<$Res>? get advert {
    if (_value.advert == null) {
      return null;
    }

    return $AdvertModelCopyWith<$Res>(_value.advert!, (value) {
      return _then(_value.copyWith(advert: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdvertDetailModelImplCopyWith<$Res>
    implements $AdvertDetailModelCopyWith<$Res> {
  factory _$$AdvertDetailModelImplCopyWith(_$AdvertDetailModelImpl value,
          $Res Function(_$AdvertDetailModelImpl) then) =
      __$$AdvertDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "advert") AdvertModel? advert,
      @JsonKey(name: "locations") List<LocationModel>? locations});

  @override
  $AdvertModelCopyWith<$Res>? get advert;
}

/// @nodoc
class __$$AdvertDetailModelImplCopyWithImpl<$Res>
    extends _$AdvertDetailModelCopyWithImpl<$Res, _$AdvertDetailModelImpl>
    implements _$$AdvertDetailModelImplCopyWith<$Res> {
  __$$AdvertDetailModelImplCopyWithImpl(_$AdvertDetailModelImpl _value,
      $Res Function(_$AdvertDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advert = freezed,
    Object? locations = freezed,
  }) {
    return _then(_$AdvertDetailModelImpl(
      advert: freezed == advert
          ? _value.advert
          : advert // ignore: cast_nullable_to_non_nullable
              as AdvertModel?,
      locations: freezed == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertDetailModelImpl implements _AdvertDetailModel {
  const _$AdvertDetailModelImpl(
      {@JsonKey(name: "advert") this.advert,
      @JsonKey(name: "locations") final List<LocationModel>? locations})
      : _locations = locations;

  factory _$AdvertDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertDetailModelImplFromJson(json);

  @override
  @JsonKey(name: "advert")
  final AdvertModel? advert;
  final List<LocationModel>? _locations;
  @override
  @JsonKey(name: "locations")
  List<LocationModel>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdvertDetailModel(advert: $advert, locations: $locations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertDetailModelImpl &&
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
  _$$AdvertDetailModelImplCopyWith<_$AdvertDetailModelImpl> get copyWith =>
      __$$AdvertDetailModelImplCopyWithImpl<_$AdvertDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertDetailModelImplToJson(
      this,
    );
  }
}

abstract class _AdvertDetailModel implements AdvertDetailModel {
  const factory _AdvertDetailModel(
          {@JsonKey(name: "advert") final AdvertModel? advert,
          @JsonKey(name: "locations") final List<LocationModel>? locations}) =
      _$AdvertDetailModelImpl;

  factory _AdvertDetailModel.fromJson(Map<String, dynamic> json) =
      _$AdvertDetailModelImpl.fromJson;

  @override
  @JsonKey(name: "advert")
  AdvertModel? get advert;
  @override
  @JsonKey(name: "locations")
  List<LocationModel>? get locations;
  @override
  @JsonKey(ignore: true)
  _$$AdvertDetailModelImplCopyWith<_$AdvertDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
