// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryEntityImpl _$$CategoryEntityImplFromJson(Map<String, dynamic> json) =>
    _$CategoryEntityImpl(
      catId: (json['catID'] as num?)?.toInt(),
      name: json['name'] as String?,
      isActive: json['isActive'] as bool?,
      route: json['route'] as String?,
      imgDesc: json['imgDesc'] as String?,
    );

Map<String, dynamic> _$$CategoryEntityImplToJson(
        _$CategoryEntityImpl instance) =>
    <String, dynamic>{
      'catID': instance.catId,
      'name': instance.name,
      'isActive': instance.isActive,
      'route': instance.route,
      'imgDesc': instance.imgDesc,
    };
