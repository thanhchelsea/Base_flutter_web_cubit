import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/advert/state.dart';
import 'package:repo/src/features/advert_detail/state.dart';

class AdvertDetailCubit extends BaseCubit<AdvertDetailState> {
  AdvertDetailCubit(
    this._advertUsecase,
    this._locationUsecase,
  ) : super(AdvertDetailState());
  AdvertUsecase _advertUsecase;
  LocationUsecase _locationUsecase;

  Future<void> startGetData(int advertId) async {
    await getAdvertDetail(advertId);
  }

  Future<void> getAdvertDetail(int advertId) async {
    var handle = _advertUsecase.getAdvertWithId(id: advertId);
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(advert: response.data));
      },
    );
  }
}
