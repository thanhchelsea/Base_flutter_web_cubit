// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertEntityImpl _$$AdvertEntityImplFromJson(Map<String, dynamic> json) =>
    _$AdvertEntityImpl(
      advertId: (json['advertID'] as num?)?.toInt(),
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
      sumView: (json['sumView'] as num?)?.toInt(),
      sumClick: (json['sumClick'] as num?)?.toInt(),
      isPublish: json['isPublish'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$$AdvertEntityImplToJson(_$AdvertEntityImpl instance) =>
    <String, dynamic>{
      'advertID': instance.advertId,
      'name': instance.name,
      'descriptions': instance.descriptions,
      'adsType': instance.adsType,
      'openUrl': instance.openUrl,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isActive': instance.isActive,
      'url': instance.url,
      'sumView': instance.sumView,
      'sumClick': instance.sumClick,
      'isPublish': instance.isPublish,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'tag': instance.tag,
    };
