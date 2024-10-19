import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/add_category_request/add_category_request.dart';
import 'package:common_features/location/data/model.dart/add_location_request/add_location_request.dart';
import 'package:common_features/location/data/model.dart/category_model/category_model.dart';
import 'package:common_features/location/data/model.dart/location_detail_model/location_detail_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:common_features/location/domain/entity/location_detail_entity/location_detail_entity.dart';

abstract class LocationRepository {
  Future<BaseModel<List<LocationModel>>> getAllLocation({
    int? pageNumber,
    int? pageSize,
  });

  Future<BaseModel<LocationDetailEntity>> getLocationWithId({
    required int id,
  });

  Future<BaseModel<List<CategoryModel>>> getAllCategory();
  Future<void> addCategory({
    required AddCategoryRequest request,
  });

  Future<BaseModel<LocationModel>> addLocation({
    required AddLocationRequest request,
  });
  Future<void> assignLocationCategory({
    required int catID,
    required int locationID,
  });

  Future<void> deleteLocation({
    required int id,
  });

  Future<BaseModel<List<LocationModel>>> getLocationInCate({
    required int id,
  });

  Future<BaseModel<List<LocationModel>>> getLocationWidthRaito({
    required String ratio,
  });
  Future<void> deleteCategory({
    required int id,
  });

  Future<BaseModel<LocationDetailModel?>> getLocationDetail({required int id});

  Future<void> updateLocation({
    required int id,
    required AddLocationRequest request,
  });

  Future<void> removeLocationInCategory({
    required int locationId,
    required int catId,
  });
}
