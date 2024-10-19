// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_advert_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddAdvertRequestImpl _$$AddAdvertRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AddAdvertRequestImpl(
      advertID: (json['advertID'] as num?)?.toInt(),
      name: json['name'] as String?,
      descriptions: json['descriptions'] as String?,
      adsType: (json['adsType'] as num?)?.toInt(),
      openUrl: json['openUrl'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      isActive: json['isActive'] as bool?,
      url: json['url'] as String?,
      isPublish: json['isPublish'] as bool?,
      tag: json['tag'] as String?,
      createdBy: json['createdBy'] as String?,
    );

Map<String, dynamic> _$$AddAdvertRequestImplToJson(
        _$AddAdvertRequestImpl instance) =>
    <String, dynamic>{
      'advertID': instance.advertID,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'adsType': instance.adsType,
      'openUrl': instance.openUrl,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isActive': instance.isActive,
      'url': instance.url,
      'isPublish': instance.isPublish,
      'tag': instance.tag,
      'createdBy': instance.createdBy,
    };
