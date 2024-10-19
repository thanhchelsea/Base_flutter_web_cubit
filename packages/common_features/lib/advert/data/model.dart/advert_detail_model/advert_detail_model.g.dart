// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertDetailModelImpl _$$AdvertDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvertDetailModelImpl(
      advert: json['advert'] == null
          ? null
          : AdvertModel.fromJson(json['advert'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdvertDetailModelImplToJson(
        _$AdvertDetailModelImpl instance) =>
    <String, dynamic>{
      'advert': instance.advert,
      'locations': instance.locations,
    };
