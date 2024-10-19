// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      catId: (json['catID'] as num?)?.toInt(),
      name: json['name'] as String?,
      isActive: json['isActive'] as bool?,
      route: json['route'] as String?,
      imgDesc: json['imgDesc'] as String?,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'catID': instance.catId,
      'name': instance.name,
      'isActive': instance.isActive,
      'route': instance.route,
      'imgDesc': instance.imgDesc,
    };
