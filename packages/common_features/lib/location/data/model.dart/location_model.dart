import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    @JsonKey(name: "locationID") int? locationId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "width") int? width,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "createdBy") String? createdBy,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "imgDesc") String? imgDesc,
    @JsonKey(name: "sumView") int? sumView,
    @JsonKey(name: "sumClick") int? sumClick,
    @JsonKey(name: "tag") String? tag,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
