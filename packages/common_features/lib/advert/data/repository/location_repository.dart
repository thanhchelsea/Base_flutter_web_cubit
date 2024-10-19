import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/data/model.dart/advert_detail_model/advert_detail_model.dart';
import 'package:common_features/advert/data/model.dart/advert_model.dart';
import 'package:common_features/advert/data/remote/location_service.dart';
import 'package:common_features/advert/domain/repository/advert_repository.dart';
import 'package:common_features/base_model/base_model.dart';

class AdvertRepoImpl extends AdvertRepository {
  AdvertRepoImpl(this._advertService);
  AdvertService _advertService;
  @override
  Future<BaseModel<List<AdvertModel>>> getAllAdvert({
    int? pageNumber,
    int? pageSize,
  }) {
    return _advertService.getAllAdvert(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );
  }

  @override
  Future<BaseModel<AdvertDetailModel?>> getAdvertWithId({required int id}) {
    return _advertService.getLocationWithId(id: id);
  }

  @override
  Future<BaseModel<AdvertModel?>> addAdvert(
      {required AddAdvertRequest request}) {
    return _advertService.addAdvert(request: request);
  }

  @override
  Future<void> setAdvertInLocation(
      {required int advertId, required List<int> locationIds}) {
    return _advertService.setAdvertInLocation(
        advertId: advertId, locationIds: locationIds);
  }

  @override
  Future<void> updateAdvert(
      {required int id, required AddAdvertRequest request}) {
    return _advertService.updateAdvert(id: id, request: request);
  }

  @override
  Future<void> deleteAdvert({required int id}) {
    return _advertService.deleteAdvert(id: id);
  }

  @override
  Future<BaseModel<List<AdvertModel>>> getAdvertsInLocation(
      {required int locationId}) {
    return _advertService.getAdvertsInLocation(locationId: locationId);
  }

  @override
  Future<void> setUserTestAdvert({
    required int advertId,
    required String userName,
  }) {
    return _advertService.setUserTestAdvert(
      advertId: advertId,
      userName: userName,
    );
  }

  @override
  Future<BaseModel<List<AdvertModel>>> getAdvertWithSearchValue(
      {required String? keyword}) {
    return _advertService.getAdvertWithSearchValue(keyword: keyword);
  }

  @override
  Future<void> removeAdvertInLocation({
    required int advertId,
    required int locationId,
  }) {
    return _advertService.removeAdvertInLocation(
      advertId: advertId,
      locationId: locationId,
    );
  }
}
