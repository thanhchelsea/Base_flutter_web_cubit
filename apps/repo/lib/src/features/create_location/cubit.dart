import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common_features/advert/data/model.dart/add_advert_request.dart';
import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/location/data/model.dart/add_location_request/add_location_request.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:flutter/material.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/create_location/state.dart';
import 'package:repo/src/injector/injector.dart';

class CreateLocationCubit extends BaseCubit<CreateLocationState> {
  CreateLocationCubit(
    this._locationUsecase,
    this._advertUsecase,
  ) : super(
          CreateLocationState(),
        );

  LocationUsecase _locationUsecase;
  AdvertUsecase _advertUsecase;
  AppCubit _appCubit = Injector.instance();
  TextEditingController imgDesCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController widthCtrl = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController tagCtrl = TextEditingController();

  MultiSelectController<CategoryEntity>? categoryCtrl =
      MultiSelectController([]);
  MultiSelectController<AdvertEntity>? advertsCtrl = MultiSelectController([]);
  Future<void> startGetData(int? advertId) async {
    await getCategories();
    // await getAdverts();
    if (advertId != null) {
      await getLocation(advertId);
    }
  }

  Future<void> getLocation(int id) async {
    var handle = _locationUsecase.getLocationWithId(id: id);
    await callDataService(
      handle,
      onSuccess: (response) {
        final location = response.data;
        if (location == null) return;
        categoryCtrl?.value = location.categories ?? [];

        emit(
          state.copyWith(
            location: location.location,
            categoiesSelected: location.categories,
            isActive: location.location?.isActive,
          ),
        );
        imgDesCtrl.text = location.location?.imgDesc ?? '';
        nameCtrl.text = location.location?.name ?? '';
        tagCtrl.text = location.location?.tag ?? '';
        widthCtrl.text = location.location?.width.toString() ?? '';
        height.text = location.location?.height.toString() ?? '';
      },
    );
    await getAdvertsSelected(id);
  }

  Future<void> getCategories() async {
    var handle = _locationUsecase.getAllCategory();
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(
          state.copyWith(categoies: response.data ?? []),
        );
      },
    );
  }

  Future<void> getAdvertsSelected(int locationId) async {
    var handle = _advertUsecase.getAdvertsInLocation(locationId: locationId);
    await callDataService(
      handle,
      onSuccess: (response) {
        advertsCtrl?.value = response.data ?? [];
        emit(state.copyWith(advertsSelected: response.data));
      },
    );
  }

  Future<void> getAdverts() async {
    var handle = _advertUsecase.getAllAdvert();
    await callDataService(
      handle,
      onSuccess: (response) {
        emit(state.copyWith(adverts: response.data));
      },
    );
  }

  Future<void> createLocation() async {
    // emit(state.copyWith(processIndex: 1));
    // return;
    var handle = _locationUsecase.addLocation(
        request: AddLocationRequest(
      height: int.parse(height.text),
      width: int.parse(widthCtrl.text),
      imgDesc: imgDesCtrl.text.trim(),
      isActive: true,
      name: nameCtrl.text.trim(),
      tag: tagCtrl.text.trim(),
    ));

    await callDataService(
      handle,
      onSuccess: (response) {
        showSuccessToast('Tạo vị trí thành công');
        emit(state.copyWith(processIndex: 1)..location = response.data);
      },
    );
  }

  Future<void> updateLocation() async {
    var handle = _locationUsecase.updateLocation(
      id: state.location?.locationId ?? -1,
      request: AddLocationRequest(
        height: int.parse(height.text),
        width: int.parse(widthCtrl.text),
        imgDesc: imgDesCtrl.text.trim(),
        isActive: true,
        name: nameCtrl.text.trim(),
        tag: tagCtrl.text.trim(),
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

  void pinAdvert() async {
    if (state.location != null) {
      await Future.forEach(
        state.advertsSelected,
        (element) async {
          var handle = _advertUsecase.setAdvertInLocation(
            advertId: element.advertId ?? -1,
            locationIds: [
              state.location?.locationId ?? -1,
            ],
          );
          await callDataService(
            handle,
            isShowError: false,
            onSuccess: (response) {},
          );
        },
      );
    }
    showSuccessToast('Gán quảng cáo thành công');
    emit(state.copyWith(processIndex: 3));
  }

  void pinCategory() async {
    List<int> cateIds = [];
    cateIds = categoryCtrl?.value.map(
          (e) {
            return e.catId ?? -1;
          },
        ).toList() ??
        [];
    if (state.location != null) {
      await Future.forEach(
        state.categoies,
        (element) async {
          var handle = _locationUsecase.assignLocationCategory(
            catID: element.catId ?? -1,
            locationID: state.location?.locationId ?? -1,
          );
          await callDataService(
            handle,
            isShowError: false,
            onSuccess: (response) {},
          );
        },
      );
      showSuccessToast('Gán category thành công');
      emit(state.copyWith(processIndex: 2));
    }
  }

  void clear() {
    nameCtrl.clear();
    tagCtrl.clear();
    categoryCtrl?.clear();
    widthCtrl.clear();
    height.clear();
    imgDesCtrl.clear();
    emit(state.copyWith(isActive: true)
      ..location = null
      ..processIndex = 0);
  }

  void onChangIsPublic(bool v) {
    emit(state.copyWith(isActive: v));
  }

  void onChangedCategory(List<CategoryEntity> v) {
    emit(state.copyWith(categoiesSelected: [...v]));
  }

  void onChangeAdverts(List<AdvertEntity> v) {
    emit(
      state.copyWith(
        advertsSelected: [
          ...v,
        ],
      ),
    );
  }

  Future<void> deleteCate(CategoryEntity? v) async {
    var handle = _locationUsecase.removeLocationInCategory(
      locationId: state.location?.locationId ?? -1,
      catId: v?.catId ?? -1,
    );
    await callDataService(
      handle,
      isShowError: false,
      onSuccess: (response) {
        // showSuccessToast('Xoá category thành công');
      },
    );
  }

  void deleteAdvert(AdvertEntity l) async {
    var handle = _advertUsecase.removeAdvertInLocation(
      locationId: state.location?.locationId ?? -1,
      advertId: l.advertId ?? -1,
    );
    await callDataService(
      handle,
      isShowError: false,
      onSuccess: (response) {
        // showSuccessToast('Xoá quảng cáo thành công');
      },
    );
    if (advertsCtrl?.value.contains(l) ?? false) {
      advertsCtrl?.remove(l);
    }
    var data = [...state.advertsSelected];
    data.remove(l);
    emit(state.copyWith(advertsSelected: [...data]));
  }
}
