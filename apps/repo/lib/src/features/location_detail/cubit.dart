import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/advert/state.dart';
import 'package:repo/src/features/advert_detail/state.dart';
import 'package:repo/src/features/location_detail/state.dart';

class LocationDetailCubit extends BaseCubit<LocationDetailState> {
  LocationDetailCubit(
    this._advertUsecase,
    this._locationUsecase,
  ) : super(LocationDetailState());
  AdvertUsecase _advertUsecase;
  LocationUsecase _locationUsecase;

  Future<void> startGetData(int locationId) async {
    await getLocationDetail(locationId);
    await getAdverts(locationId);
  }

  Future<void> getLocationDetail(int locationId) async {
    var handle = _locationUsecase.getLocationDetail(id: locationId);
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(location: response.data));
      },
    );
  }

  Future<void> getAdverts(int locationId) async {
    var handle = _advertUsecase.getAdvertsInLocation(locationId: locationId);
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(adverts: response.data));
      },
    );
  }
}
