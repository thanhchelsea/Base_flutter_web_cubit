import 'dart:convert';

import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/add_category_request/add_category_request.dart';
import 'package:common_features/location/data/model.dart/add_location_request/add_location_request.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_detail_entity/location_detail_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:common_features/location/domain/repository/location_repository.dart';

class LocationUsecase {
  LocationUsecase(this._locationRepository);
  final LocationRepository _locationRepository;
  Future<BaseModel<List<LocationEntity>>> getAllLocation({
    int? pageNumber,
    int? pageSize,
  }) async {
    var data = await _locationRepository.getAllLocation(
      pageNumber: pageNumber,
      pageSize: pageSize,
    );

    var dataEntity = data.data?.map(
      (e) {
        return LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<LocationEntity>>(data: dataEntity, page: data.page);
  }

  Future<BaseModel<LocationDetailEntity?>> getLocationWithId({
    required int id,
  }) async {
    var data = await _locationRepository.getLocationWithId(id: id);

    var cate = data.data?.categories?.map(
      (e) {
        return CategoryEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    var l = LocationDetailEntity(
        categories: cate,
        location: LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(data.data?.location!.toJson()),
          ) as Map<String, dynamic>,
        ));
    return BaseModel<LocationDetailEntity>(data: l, page: data.page);
  }

  Future<void> addCategory({required AddCategoryRequest request}) {
    return _locationRepository.addCategory(request: request);
  }

  @override
  Future<BaseModel<List<CategoryEntity>>> getAllCategory() async {
    var data = await _locationRepository.getAllCategory();
    var dataEntity = data.data?.map(
      (e) {
        return CategoryEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<CategoryEntity>>(data: dataEntity, page: data.page);
  }

  Future<BaseModel<LocationEntity?>> addLocation(
      {required AddLocationRequest request}) async {
    var data = await _locationRepository.addLocation(request: request);
    return BaseModel<LocationEntity?>(
      data: LocationEntity.fromJson(
        jsonDecode(
          jsonEncode(data.data!),
        ) as Map<String, dynamic>,
      ),
      page: data.page,
    );
  }

  Future<void> assignLocationCategory({
    required int catID,
    required int locationID,
  }) {
    return _locationRepository.assignLocationCategory(
      catID: catID,
      locationID: locationID,
    );
  }

  Future<void> deleteLocation({required int id}) {
    return _locationRepository.deleteLocation(id: id);
  }

  Future<BaseModel<List<LocationEntity>>> getLocationInCate(
      {required int id}) async {
    var data = await _locationRepository.getLocationInCate(id: id);
    var dataEntity = data.data?.map(
      (e) {
        return LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<LocationEntity>>(data: dataEntity, page: data.page);
  }

  Future<BaseModel<List<LocationEntity>>> getLocationWidthRaito(
      {required String ratio}) async {
    var data = await _locationRepository.getLocationWidthRaito(ratio: ratio);
    var dataEntity = data.data?.map(
      (e) {
        return LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    return BaseModel<List<LocationEntity>>(data: dataEntity, page: data.page);
  }

  Future<void> deleteCategory({required int id}) {
    return _locationRepository.deleteCategory(id: id);
  }

  Future<BaseModel<LocationDetailEntity?>> getLocationDetail(
      {required int id}) async {
    var data = await _locationRepository.getLocationDetail(id: id);
    var cate = data.data?.categories?.map(
      (e) {
        return CategoryEntity.fromJson(
          jsonDecode(
            jsonEncode(e.toJson()),
          ) as Map<String, dynamic>,
        );
      },
    ).toList();
    var l = LocationDetailEntity(
        categories: cate,
        location: LocationEntity.fromJson(
          jsonDecode(
            jsonEncode(data.data?.location!.toJson()),
          ) as Map<String, dynamic>,
        ));
    return BaseModel<LocationDetailEntity>(data: l, page: data.page);
  }

  Future<void> updateLocation({
    required int id,
    required AddLocationRequest request,
  }) async {
    return _locationRepository.updateLocation(id: id, request: request);
  }

  Future<void> removeLocationInCategory(
      {required int locationId, required int catId}) {
    return _locationRepository.removeLocationInCategory(
      locationId: locationId,
      catId: catId,
    );
  }
}
