import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/data/model.dart/advert_detail_model/advert_detail_model.dart';
import 'package:common_features/advert/data/model.dart/advert_model.dart';
import 'package:common_features/base_model/base_model.dart';
import 'package:common_features/location/data/model.dart/location_model.dart';
import 'package:common_features/path.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'location_service.g.dart';

@RestApi()
abstract class AdvertService {
  factory AdvertService(Dio dio, {String? baseUrl}) = _AdvertService;

  @GET('$getAllAdvertPath')
  Future<BaseModel<List<AdvertModel>>> getAllAdvert({
    @Query('pageNumber') int? pageNumber,
    @Query('pageSize') int? pageSize,
  });

  @GET('$getAdvertWithIdPath/{id}')
  Future<BaseModel<AdvertDetailModel?>> getLocationWithId({
    @Path('id') required int id,
  });
  @POST('$addAdvertPath')
  Future<BaseModel<AdvertModel?>> addAdvert({
    @Body() required AddAdvertRequest request,
  });

  @POST('$setAdvertInLocationPath')
  Future<void> setAdvertInLocation({
    @Field('advertId') required int advertId,
    @Field('locationIds') required List<int> locationIds,
  });

  @PUT('$updateAdvertPath/{id}')
  Future<void> updateAdvert({
    @Path('id') required int id,
    @Body() required AddAdvertRequest request,
  });

  @GET('/Advert/ByLocation/{locationId}')
  Future<BaseModel<List<AdvertModel>>> getAdvertsInLocation({
    @Path('locationId') required int locationId,
  });

  @DELETE('$deleteAdvertPath/{id}')
  Future<void> deleteAdvert({
    @Path('id') required int id,
  });

  @POST('$setUserTestAdvertPath/{advertId}/{userName}')
  Future<void> setUserTestAdvert({
    @Path('advertId') required int advertId,
    @Path('userName') required String userName,
  });

  @GET('$getAdvertWithSearchValuePath')
  Future<BaseModel<List<AdvertModel>>> getAdvertWithSearchValue({
    @Query('keyword') required String? keyword,
  });

  @DELETE('$removeAdvertInLocationPath/{advertId}/{locationId}')
  Future<void> removeAdvertInLocation({
    @Path('advertId') required int advertId,
    @Path('locationId') required int locationId,
  });
}
