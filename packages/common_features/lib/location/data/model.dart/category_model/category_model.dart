import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: "catID") int? catId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "isActive") bool? isActive,
    @JsonKey(name: "route") String? route,
    @JsonKey(name: "imgDesc") String? imgDesc,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
