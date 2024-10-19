import 'package:common_features/advert/data/model.dart/advert_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'advert_detail_model.freezed.dart';
part 'advert_detail_model.g.dart';

@freezed
class AdvertDetailModel with _$AdvertDetailModel {
  const factory AdvertDetailModel({
    @JsonKey(name: "advert") AdvertModel? advert,
    @JsonKey(name: "locations") List<LocationModel>? locations,
  }) = _AdvertDetailModel;

  factory AdvertDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertDetailModelFromJson(json);
}
