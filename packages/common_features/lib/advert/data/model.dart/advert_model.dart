import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'advert_model.freezed.dart';
part 'advert_model.g.dart';

@freezed
class AdvertModel with _$AdvertModel {
  const factory AdvertModel({
    @JsonKey(name: "advertID") int? advertId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "descriptions") String? descriptions,
    @JsonKey(name: "adsType") int? adsType,
    @JsonKey(name: "openUrl") String? openUrl,
    @JsonKey(name: "startDate") DateTime? startDate,
    @JsonKey(name: "endDate") DateTime? endDate,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "sumView") int? sumView,
    @JsonKey(name: "sumClick") int? sumClick,
    @JsonKey(name: "isPublish") bool? isPublish,
    @JsonKey(name: "createdAt") DateTime? createdAt,
    @JsonKey(name: "createdBy") String? createdBy,
    @JsonKey(name: "tag") String? tag,
  }) = _AdvertModel;

  factory AdvertModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertModelFromJson(json);
}
