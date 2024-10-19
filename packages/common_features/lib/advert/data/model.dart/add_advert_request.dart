import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_advert_request.freezed.dart';
part 'add_advert_request.g.dart';

@freezed
class AddAdvertRequest with _$AddAdvertRequest {
  const factory AddAdvertRequest({
    @JsonKey(name: "advertID") int? advertID,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "descriptions") String? descriptions,
    @JsonKey(name: "adsType") int? adsType,
    @JsonKey(name: "openUrl") String? openUrl,
    @JsonKey(name: "startDate") DateTime? startDate,
    @JsonKey(name: "endDate") DateTime? endDate,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "isPublish") bool? isPublish,
    @JsonKey(name: "tag") String? tag,
    @JsonKey(name: "createdBy") String? createdBy,
  }) = _AddAdvertRequest;

  factory AddAdvertRequest.fromJson(Map<String, dynamic> json) =>
      _$AddAdvertRequestFromJson(json);
}
