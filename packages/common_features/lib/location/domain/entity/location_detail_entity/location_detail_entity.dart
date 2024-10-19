import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'location_detail_entity.freezed.dart';
part 'location_detail_entity.g.dart';

@freezed
class LocationDetailEntity with _$LocationDetailEntity {
  const factory LocationDetailEntity({
    @JsonKey(name: "location") LocationEntity? location,
    @JsonKey(name: "categories") List<CategoryEntity>? categories,
  }) = _LocationDetailEntity;

  factory LocationDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailEntityFromJson(json);
}
