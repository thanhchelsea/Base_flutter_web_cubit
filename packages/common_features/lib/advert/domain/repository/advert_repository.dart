import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/data/model.dart/advert_detail_model/advert_detail_model.dart';
import 'package:common_features/advert/data/model.dart/advert_model.dart';
import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';

abstract class AdvertRepository {
  Future<BaseModel<List<AdvertModel>>> getAllAdvert({
    int? pageNumber,
    int? pageSize,
  });

  Future<BaseModel<AdvertDetailModel?>> getAdvertWithId({
    required int id,
  });

  Future<BaseModel<AdvertModel?>> addAdvert({
    required AddAdvertRequest request,
  });

  Future<void> setAdvertInLocation({
    required int advertId,
    required List<int> locationIds,
  });

  Future<void> updateAdvert({
    required int id,
    required AddAdvertRequest request,
  });

  Future<void> deleteAdvert({
    required int id,
  });
  Future<BaseModel<List<AdvertModel>>> getAdvertsInLocation({
    required int locationId,
  });

  Future<void> setUserTestAdvert({
    required int advertId,
    required String userName,
  });

  Future<BaseModel<List<AdvertModel>>> getAdvertWithSearchValue({
    required String? keyword,
  });

  Future<void> removeAdvertInLocation({
    required int advertId,
    required int locationId,
  });
}
