import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/add_category_request/add_category_request.dart';
import 'package:common_features/location/data/model.dart/add_location_request/add_location_request.dart';
import 'package:common_features/location/data/model.dart/category_model/category_model.dart';
import 'package:common_features/location/data/model.dart/location_detail_model/location_detail_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:common_features/location/data/remote/location_service.dart';
import 'package:common_features/location/domain/entity/location_detail_entity/location_detail_entity.dart';
import 'package:common_features/location/domain/repository/location_repository.dart';

class LocationRepoImpl extends LocationRepository {
  LocationRepoImpl(this._locationService);
  LocationService _locationService;
  @override
  Future<BaseModel<List<LocationModel>>> getAllLocation(
      {int? pageNumber, int? pageSize}) {
    return _locationService.getAllLocation(
        pageNumber: pageNumber, pageSize: pageSize);
  }

  @override
  Future<BaseModel<LocationDetailEntity>> getLocationWithId({required int id}) {
    return _locationService.getLocationWithId(id: id);
  }

  @override
  Future<void> addCategory({required AddCategoryRequest request}) {
    return _locationService.addCategory(request: request);
  }

  @override
  Future<BaseModel<List<CategoryModel>>> getAllCategory() {
    return _locationService.getAllCategory();
  }

  @override
  Future<BaseModel<LocationModel>> addLocation(
      {required AddLocationRequest request}) {
    return _locationService.addLocation(request: request);
  }

  @override
  Future<void> assignLocationCategory(
      {required int catID, required int locationID}) {
    return _locationService.assignLocationCategory(
        catID: catID, locationID: locationID);
  }

  @override
  Future<void> deleteLocation({required int id}) {
    return _locationService.deleteLocation(id: id);
  }

  @override
  Future<BaseModel<List<LocationModel>>> getLocationInCate({required int id}) {
    return _locationService.getLocationInCate(id: id);
  }

  @override
  Future<BaseModel<List<LocationModel>>> getLocationWidthRaito(
      {required String ratio}) {
    return _locationService.getLocationWidthRaito(ratio: ratio);
  }

  @override
  Future<void> deleteCategory({required int id}) {
    return _locationService.deleteCategory(id: id);
  }

  @override
  Future<BaseModel<LocationDetailModel?>> getLocationDetail({required int id}) {
    return _locationService.getLocationDetail(id: id);
  }

  @override
  Future<void> updateLocation(
      {required int id, required AddLocationRequest request}) {
    return _locationService.updateLocation(id: id, request: request);
  }

  @override
  Future<void> removeLocationInCategory(
      {required int locationId, required int catId}) {
    return _locationService.removeLocationInCategory(
        locationId: locationId, catId: catId);
  }
}
