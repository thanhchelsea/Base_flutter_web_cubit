// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDetailModelImpl _$$LocationDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationDetailModelImpl(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LocationDetailModelImplToJson(
        _$LocationDetailModelImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'categories': instance.categories,
    };
