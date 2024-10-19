// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertDetailEntityImpl _$$AdvertDetailEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AdvertDetailEntityImpl(
      advert: json['advert'] == null
          ? null
          : AdvertEntity.fromJson(json['advert'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => LocationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AdvertDetailEntityImplToJson(
        _$AdvertDetailEntityImpl instance) =>
    <String, dynamic>{
      'advert': instance.advert,
      'locations': instance.locations,
    };
