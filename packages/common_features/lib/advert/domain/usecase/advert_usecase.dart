import 'dart:convert';

import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/data/model.dart/advert_detail_model/advert_detail_model.dart';
import 'package:common_features/advert/domain/entity/advert_detail_entity/advert_detail_entity.dart';
import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/advert/domain/repository/advert_repository.dart';
import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';

class AdvertUsecase {
  AdvertUsecase(this._advertRepo);
  final AdvertRepository _advertRepo;
  Future<BaseModel<List<AdvertEntity>>> getAllAdvert({
    int? pageNumber,
    int? pageSize,
  }) async {
    var data = await _advertRepo.getAllAdvert(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );

    var dataEntity = data.data?.map(
      (e) {
        return AdvertEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<AdvertEntity>>(data: dataEntity, page: data.page);
  }

  Future<BaseModel<AdvertDetailEntity?>> getAdvertWithId({
    required int id,
  }) async {
    var data = await _advertRepo.getAdvertWithId(id: id);

    var loca = data.data?.locations?.map(
      (e) {
        return LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    var l = AdvertDetailEntity(
        locations: loca,
        advert: AdvertEntity.fromJson(
          jsonDecode(
            jsonEncode(data.data?.advert!.toJson()),
          ) as Map<String, dynamic>,
        ));
    return BaseModel<AdvertDetailEntity?>(data: l, page: data.page);
  }

  Future<BaseModel<AdvertEntity?>> addAdvert(
      {required AddAdvertRequest request}) async {
    var data = await _advertRepo.addAdvert(request: request);
    return BaseModel<AdvertEntity?>(
      data: AdvertEntity.fromJson(
        jsonDecode(
          jsonEncode(data.data!),
        ) as Map<String, dynamic>,
      ),
      page: data.page,
    );
  }

  Future<void> setAdvertInLocation({
    required int advertId,
    required List<int> locationIds,
  }) {
    return _advertRepo.setAdvertInLocation(
      advertId: advertId,
      locationIds: locationIds,
    );
  }

  Future<void> updateAdvert({
    required int id,
    required AddAdvertRequest request,
  }) {
    return _advertRepo.updateAdvert(id: id, request: request);
  }

  Future<void> deleteAdvert({required int id}) {
    return _advertRepo.deleteAdvert(id: id);
  }

  Future<BaseModel<List<AdvertEntity>>> getAdvertsInLocation({
    required int locationId,
  }) async {
    var data = await _advertRepo.getAdvertsInLocation(locationId: locationId);

    var dataEntity = data.data?.map(
      (e) {
        return AdvertEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<AdvertEntity>>(data: dataEntity, page: data.page);
  }

  Future<void> setUserTestAdvert({
    required int advertId,
    required String userName,
  }) {
    return _advertRepo.setUserTestAdvert(
      advertId: advertId,
      userName: userName,
    );
  }

  Future<BaseModel<List<AdvertEntity>>> getAdvertWithSearchValue(
      {required String? keyword}) async {
    var data = await _advertRepo.getAdvertWithSearchValue(keyword: keyword);

    var dataEntity = data.data?.map(
      (e) {
        return AdvertEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<AdvertEntity>>(data: dataEntity, page: data.page);
  }

  Future<void> removeAdvertInLocation({
    required int advertId,
    required int locationId,
  }) {
    return _advertRepo.removeAdvertInLocation(
      advertId: advertId,
      locationId: locationId,
    );
  }
}
