import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/advert/state.dart';

class AdvertCubit extends BaseCubit<AdvertState> {
  AdvertCubit(this._adverUsecase) : super(AdvertState());
  ScrollController scrollController = ScrollController();
  AdvertUsecase _adverUsecase;
  int pageNumber = 1;
  int totalRecords = 0;

  Future getData() async {
    pageNumber = 1;
    totalRecords = 0;
    await getAllLocation();
  }

  Future<void> getAllLocation({bool isLoadMore = false}) async {
    if (isLoadMore && state.adverts.length >= totalRecords) {
      return;
    }
    if (isLoadMore) {
      pageNumber++;
    }

    var handle =
        _adverUsecase.getAllAdvert(pageNumber: pageNumber, pageSize: 20);
    await callDataService(
      handle,
      onSuccess: (response) {
        var data = [...state.adverts];
        if (isLoadMore) {
          data.addAll(response.data ?? []);
        } else {
          pageNumber = 1;
          data = response.data ?? [];
        }
        totalRecords = response.page?.totalRecords ?? 0;
        emit(state.copyWith(adverts: [...data]));
      },
    );
  }

  void deleteAdvert(AdvertEntity advert) async {
    var handle = _adverUsecase.deleteAdvert(id: advert.advertId ?? -1);
    await callDataService(
      handle,
      onSuccess: (v) {
        showSuccessToast('Xoá thành công');
        pageNumber = 1;
        totalRecords = 0;
        getAllLocation();
      },
    );
  }
}
