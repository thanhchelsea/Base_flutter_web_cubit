// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDetailEntityImpl _$$LocationDetailEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationDetailEntityImpl(
      location: json['location'] == null
          ? null
          : LocationEntity.fromJson(json['location'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LocationDetailEntityImplToJson(
        _$LocationDetailEntityImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'categories': instance.categories,
    };
