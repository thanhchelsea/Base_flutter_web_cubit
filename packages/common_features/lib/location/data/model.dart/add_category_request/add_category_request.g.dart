// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddCategoryRequestImpl _$$AddCategoryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddCategoryRequestImpl(
      catId: (json['catID'] as num?)?.toInt(),
      name: json['name'] as String?,
      isActive: json['isActive'] as bool?,
      route: json['route'] as String?,
      imgDesc: json['imgDesc'] as String?,
    );

Map<String, dynamic> _$$AddCategoryRequestImplToJson(
        _$AddCategoryRequestImpl instance) =>
    <String, dynamic>{
      'catID': instance.catId,
      'name': instance.name,
      'isActive': instance.isActive,
      'route': instance.route,
      'imgDesc': instance.imgDesc,
    };
