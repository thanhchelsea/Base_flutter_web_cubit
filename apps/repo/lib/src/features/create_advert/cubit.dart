import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/create_advert/state.dart';
import 'package:repo/src/injector/injector.dart';

class CreateAdvertCubit extends BaseCubit<CreateAdvertState> {
  CreateAdvertCubit(this._advertUsecase, this._locationUsecase)
      : super(
          CreateAdvertState(
            adsType: 0,
            startDate: DateTime.now(),
            endDate: DateTime.now().add(
              const Duration(days: 1),
            ),
          ),
        );

  AdvertUsecase _advertUsecase;
  LocationUsecase _locationUsecase;
  AppCubit _appCubit = Injector.instance();
  TextEditingController desCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController openUrlCtrl = TextEditingController();
  TextEditingController tagCtrl = TextEditingController();
  TextEditingController urlCtrl = TextEditingController();
  TextEditingController userTestCtrl = TextEditingController();

  SingleSelectController<CategoryEntity?>? cateCtrl =
      SingleSelectController(null);
  SingleSelectController<String?>? raitoCtrl = SingleSelectController(null);
  MultiSelectController<LocationEntity>? locationCateCtrl =
      MultiSelectController([]);
  MultiSelectController<LocationEntity>? locationRaitoCtrl =
      MultiSelectController([]);
  Future<void> startGetData(int? advertId) async {
    // await getLocations();
    await getCategories();
    if (advertId != null) {
      await getAdvert(advertId);
    }
  }

  Future<void> getCategories() async {
    var handle = _locationUsecase.getAllCategory();
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(categories: response.data ?? []));
      },
    );
  }

  Future<void> getAdvert(int id) async {
    var handle = _advertUsecase.getAdvertWithId(id: id);
    await callDataService(
      handle,
      onSuccess: (response) {
        final advert = response.data;
        if (advert == null) return;
        emit(
          state.copyWith(
            locationsSelected: response.data?.locations ?? [],
            advert: advert.advert,
            adsType: advert.advert?.adsType,
            endDate: advert.advert?.endDate,
            startDate: advert.advert?.startDate,
            isActive: advert.advert?.isPublish,
          ),
        );
        desCtrl.text = advert.advert?.descriptions ?? '';
        nameCtrl.text = advert.advert?.name ?? '';
        openUrlCtrl.text = advert.advert?.openUrl ?? '';
        tagCtrl.text = advert.advert?.tag ?? '';
        urlCtrl.text = advert.advert?.url ?? '';
      },
    );
  }

  Future<void> getLocations() async {
    var handle = _locationUsecase.getAllLocation();
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(
          state.copyWith(locations: response.data ?? []),
        );
      },
    );
  }

  Future<void> createAdvert() async {
    // emit(state.copyWith(processIndex: 1));
    // return;
    var handle = _advertUsecase.addAdvert(
      request: AddAdvertRequest(
        adsType: state.adsType,
        descriptions: desCtrl.text.trim(),
        startDate: state.startDate,
        endDate: state.endDate,
        isPublish: state.isPublish,
        name: nameCtrl.text.trim(),
        openUrl: openUrlCtrl.text.trim(),
        tag: tagCtrl.text.trim(),
        url: urlCtrl.text.trim(),
        createdBy: _appCubit.state.userProfileEntity?.fullname ?? '',
      ),
    );
    await callDataService(
      handle,
      onSuccess: (response) {
        showSuccessToast('Tạo quảng cáo thành công');
        emit(state.copyWith(processIndex: 1)..advert = response.data);
        setUserTestAdver();
      },
    );
  }

  Future<void> updateAdvert() async {
    // emit(state.copyWith(processIndex: 1));
    // return;

    var handle = _advertUsecase.updateAdvert(
      id: state.advert?.advertId ?? -1,
      request: AddAdvertRequest(
        adsType: state.adsType,
        descriptions: desCtrl.text,
        startDate: state.startDate,
        endDate: state.endDate,
        isPublish: state.isPublish,
        name: nameCtrl.text,
        openUrl: openUrlCtrl.text,
        tag: tagCtrl.text,
        url: urlCtrl.text,
        createdBy: _appCubit.state.userProfileEntity?.fullname ?? '',
        advertID: state.advert?.advertId ?? -1,
        isActive: true,
      ),
    );
    await callDataService(
      handle,
      onSuccess: (response) {
        showSuccessToast('Cập nhật thành công');
        emit(state.copyWith(processIndex: 1));
      },
    );
  }

  void updateStartDate(DateTime? v) {
    emit(state.copyWith()..startDate = v);
  }

  void updateEndDate(DateTime? v) {
    emit(state.copyWith()..endDate = v);
  }

  void onChangedLocationCate(List<LocationEntity> v) {
    emit(state.copyWith(locationsCateSelected: [...v]));
    pinLocation(v);
  }

  void onChangedLocationRaito(List<LocationEntity> v) {
    // locationRaitoCtrl?.clear();
    emit(state.copyWith(locationsRaitoSelected: [...v]));
    pinLocation(v);
  }

  void deleteLocation(LocationEntity l) async {
    var handle = _advertUsecase.removeAdvertInLocation(
      locationId: l.locationId ?? -1,
      advertId: state.advert?.advertId ?? -1,
    );
    await callDataService(
      handle,
      isShowError: false,
      onSuccess: (response) {
        // showSuccessToast('Xoá quảng cáo thành công');
      },
    );

    if (state.locationsSelected.contains(l)) {
      var data = [...state.locationsSelected];
      data.remove(l);
      emit(state.copyWith(locationsSelected: [...data]));
    }
    if (state.locationsCateSelected.contains(l)) {
      locationCateCtrl?.remove(l);
      var data = [...state.locationsCateSelected];
      data.remove(l);
      emit(state.copyWith(locationsCateSelected: [...data]));
    }
    if (state.locationsRaitoSelected.contains(l)) {
      locationRaitoCtrl?.remove(l);
      var data = [...state.locationsRaitoSelected];
      data.remove(l);
      emit(state.copyWith(locationsRaitoSelected: [...data]));
    }
  }

  void pinLocation(List<LocationEntity> l) async {
    List<int> locationIds = [];
    locationIds = l.map(
      (e) {
        return e.locationId ?? -1;
      },
    ).toList();
    if (state.advert != null) {
      await Future.forEach(
        locationIds,
        (element) async {
          var handle = _advertUsecase.setAdvertInLocation(
            advertId: state.advert?.advertId ?? -1,
            locationIds: [element],
          );
          await callDataService(
            handle,
            isShowError: false,
            onSuccess: (response) {},
          );
        },
      );
    }
    // showSuccessToast('Gán quảng cáo thành công');
  }

  void next() {
    var x = state.processIndex + 1;
    emit(state.copyWith(processIndex: x));
  }

  Future<void> setUserTestAdver() async {
    if (userTestCtrl.text.isNotEmpty && state.advert?.advertId != null) {
      await _advertUsecase.setUserTestAdvert(
        advertId: state.advert!.advertId!,
        userName: userTestCtrl.text,
      );
    }
  }

  void clear() {
    desCtrl.clear();
    nameCtrl.clear();
    openUrlCtrl.clear();
    tagCtrl.clear();
    urlCtrl.clear();
    locationCateCtrl?.clear();
    emit(
      state.copyWith(
          isActive: true,
          locationsSelected: [],
          locationsCateSelected: [],
          locationsRaitoSelected: [])
        ..endDate = DateTime.now().add(const Duration(days: 1))
        ..startDate = DateTime.now()
        ..advert = null
        ..processIndex = 0
        ..adsType = 0,
    );
  }

  void onChangAdsType(int v) {
    emit(state.copyWith()..adsType = v);
  }

  void onChangIsPublic(bool v) {
    emit(state.copyWith(isActive: v));
  }

  Future<void> onCateLocationSelected(CategoryEntity? v) async {
    locationCateCtrl?.clear();
    var handle = _locationUsecase.getLocationInCate(id: v?.catId ?? -1);
    emit(state.copyWith(locations: [], locationsCateSelected: []));
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(locations: response.data ?? []));
      },
    );
  }

  void onRaitoSelected(String? v) async {
    var handle = _locationUsecase.getLocationWidthRaito(ratio: v ?? '');
    emit(state.copyWith(locations: [], locationsRaitoSelected: []));
    locationRaitoCtrl?.clear();
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(locations: response.data ?? []));
      },
    );
  }

  void clearLocaiton() {
    emit(state.copyWith(locations: []));
  }
}
