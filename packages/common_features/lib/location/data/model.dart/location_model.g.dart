// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      locationId: (json['locationID'] as num?)?.toInt(),
      name: json['name'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      imgDesc: json['imgDesc'] as String?,
      sumView: (json['sumView'] as num?)?.toInt(),
      sumClick: (json['sumClick'] as num?)?.toInt(),
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'locationID': instance.locationId,
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'isActive': instance.isActive,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'imgDesc': instance.imgDesc,
      'sumView': instance.sumView,
      'sumClick': instance.sumClick,
      'tag': instance.tag,
    };
