import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'advert_entity.freezed.dart';
part 'advert_entity.g.dart';

@freezed
class AdvertEntity with _$AdvertEntity {
  const factory AdvertEntity({
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
  }) = _AdvertEntity;

  const AdvertEntity._();
  String getTypeName() {
    if (adsType == 0) return 'Ảnh';
    return 'Video';
  }

  factory AdvertEntity.fromJson(Map<String, dynamic> json) =>
      _$AdvertEntityFromJson(json);
}
