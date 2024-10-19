import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/add_category_request/add_category_request.dart';
import 'package:common_features/location/data/model.dart/add_location_request/add_location_request.dart';
import 'package:common_features/location/data/model.dart/category_model/category_model.dart';
import 'package:common_features/location/data/model.dart/location_detail_model/location_detail_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:common_features/location/domain/entity/location_detail_entity/location_detail_entity.dart';
import 'package:common_features/path.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'location_service.g.dart';

@RestApi()
abstract class LocationService {
  factory LocationService(Dio dio, {String? baseUrl}) = _LocationService;

  @GET('$getAllLocationPath')
  Future<BaseModel<List<LocationModel>>> getAllLocation({
    @Query('pageNumber') int? pageNumber,
    @Query('pageSize') int? pageSize,
  });

  @GET('$getLocationWithIdPath/{id}')
  Future<BaseModel<LocationDetailEntity>> getLocationWithId({
    @Path('id') required int id,
  });

  @POST('$addLocationPath')
  Future<BaseModel<LocationModel>> addLocation({
    @Body() required AddLocationRequest request,
  });

  @GET('$getAllCategoryPath')
  Future<BaseModel<List<CategoryModel>>> getAllCategory();

  @POST('$addCategoryPath')
  Future<void> addCategory({
    @Body() required AddCategoryRequest request,
  });

  @POST('$assignLocationCategoryPath')
  Future<void> assignLocationCategory({
    @Field('catID') required int catID,
    @Field('locationID') required int locationID,
  });

  @DELETE('$deleteLocationPath/{id}')
  Future<void> deleteLocation({
    @Path('id') required int id,
  });
  @GET('$getLocationInCatePath/{id}')
  Future<BaseModel<List<LocationModel>>> getLocationInCate({
    @Path('id') required int id,
  });

  @GET('$getLocationWidthRaitoPath/{ratio}')
  Future<BaseModel<List<LocationModel>>> getLocationWidthRaito({
    @Path('ratio') required String ratio,
  });

  @DELETE('$deleteCategoryPath/{id}')
  Future<void> deleteCategory({
    @Path('id') required int id,
  });

  @GET('/Location/{id}')
  Future<BaseModel<LocationDetailModel?>> getLocationDetail({
    @Path('id') required int id,
  });

  @PUT('$updateLocationPath/{id}')
  Future<void> updateLocation({
    @Path('id') required int id,
    @Body() required AddLocationRequest request,
  });

  @DELETE('$removeLocationInCategoryPath/{catId}/{locationId}')
  Future<void> removeLocationInCategory({
    @Path('locationId') required int locationId,
    @Path('catId') required int catId,
  });
}
