import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'advert_detail_entity.freezed.dart';
part 'advert_detail_entity.g.dart';

@freezed
class AdvertDetailEntity with _$AdvertDetailEntity {
  const factory AdvertDetailEntity({
    @JsonKey(name: "advert") AdvertEntity? advert,
    @JsonKey(name: "locations") List<LocationEntity>? locations,
  }) = _AdvertDetailEntity;

  factory AdvertDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$AdvertDetailEntityFromJson(json);
}
