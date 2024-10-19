// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddLocationRequestImpl _$$AddLocationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddLocationRequestImpl(
      name: json['name'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      imgDesc: json['imgDesc'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$AddLocationRequestImplToJson(
        _$AddLocationRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'isActive': instance.isActive,
      'imgDesc': instance.imgDesc,
      'tag': instance.tag,
    };
