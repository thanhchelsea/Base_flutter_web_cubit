import 'package:common_features/location/data/model.dart/category_model/category_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'location_detail_model.freezed.dart';
part 'location_detail_model.g.dart';

@freezed
class LocationDetailModel with _$LocationDetailModel {
  const factory LocationDetailModel({
    @JsonKey(name: "location") LocationModel? location,
    @JsonKey(name: "categories") List<CategoryModel>? categories,
  }) = _LocationDetailModel;

  factory LocationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailModelFromJson(json);
}
