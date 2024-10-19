import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/advert/state.dart';
import 'package:repo/src/features/location/state.dart';

class LocationCubit extends BaseCubit<LocationState> {
  LocationCubit(this._locationUsecase) : super(LocationState());

  LocationUsecase _locationUsecase;

  ScrollController scrollController = ScrollController();
  int pageNumber = 1;
  int totalRecords = 0;
  Future getData() async {
    await getAllLocation();
  }

  Future<void> getAllLocation({bool isLoadMore = false}) async {
    if (isLoadMore && state.locations.length >= totalRecords) {
      return;
    }
    if (isLoadMore) {
      pageNumber++;
    }
    var handle =
        _locationUsecase.getAllLocation(pageNumber: pageNumber, pageSize: 20);
    await callDataService(
      handle,
      onSuccess: (response) {
        var data = [...state.locations];
        if (isLoadMore) {
          data.addAll(response.data ?? []);
        } else {
          pageNumber = 1;
          data = response.data ?? [];
        }
        totalRecords = response.page?.totalRecords ?? 0;
        emit(state.copyWith(locations: [...data]));
      },
    );
  }

  void deleteLocation(LocationEntity location) async {
    var handle = _locationUsecase.deleteLocation(id: location.locationId ?? -1);
    await callDataService(
      handle,
      onSuccess: (v) {
        showSuccessToast('Xoá thành công');
        getAllLocation();
      },
    );
  }
}
