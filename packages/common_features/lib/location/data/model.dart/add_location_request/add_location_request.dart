import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_location_request.freezed.dart';
part 'add_location_request.g.dart';

@freezed
class AddLocationRequest with _$AddLocationRequest {
  const factory AddLocationRequest({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "width") int? width,
    @JsonKey(name: "height") int? height,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "imgDesc") String? imgDesc,
    @JsonKey(name: "tag") String? tag,
  }) = _AddLocationRequest;

  factory AddLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$AddLocationRequestFromJson(json);
}
