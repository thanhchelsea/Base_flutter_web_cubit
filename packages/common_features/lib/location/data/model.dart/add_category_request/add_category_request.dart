import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'add_category_request.freezed.dart';
part 'add_category_request.g.dart';

@freezed
class AddCategoryRequest with _$AddCategoryRequest {
  const factory AddCategoryRequest({
    @JsonKey(name: "catID") int? catId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "route") String? route,
    @JsonKey(name: "imgDesc") String? imgDesc,
  }) = _AddCategoryRequest;

  factory AddCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCategoryRequestFromJson(json);
}
