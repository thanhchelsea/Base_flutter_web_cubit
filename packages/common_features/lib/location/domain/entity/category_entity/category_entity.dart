import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_entity.freezed.dart';
part 'category_entity.g.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    @JsonKey(name: "catID") int? catId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "route") String? route,
    @JsonKey(name: "imgDesc") String? imgDesc,
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
}
