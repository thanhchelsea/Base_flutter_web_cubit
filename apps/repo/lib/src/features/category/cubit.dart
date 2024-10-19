import 'package:common_features/location/data/model.dart/add_category_request/add_category_request.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/usecase/location_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/category/state.dart';

class CategoryCubit extends BaseCubit<CategoryState> {
  CategoryCubit(this._locationUsecase) : super(CategoryState());

  LocationUsecase _locationUsecase;

  ScrollController scrollController = ScrollController();
  int pageNumber = 1;
  int totalRecords = 0;
  Future getData() async {
    await getAllCategories();
  }

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController routerCtrl = TextEditingController();
  TextEditingController imageDesCtrl = TextEditingController();

  Future<void> getAllCategories({bool isLoadMore = false}) async {
    if (isLoadMore && state.categories.length >= totalRecords) {
      return;
    }
    if (isLoadMore) {
      pageNumber++;
    }
    var handle = _locationUsecase.getAllCategory();
    await callDataService(
      handle,
      onSuccess: (response) {
        var data = [...state.categories];
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

  void createCate(BuildContext context) async {
    var handle = _locationUsecase.addCategory(
      request: AddCategoryRequest(
        catId: 0,
        imgDesc: imageDesCtrl.text,
        isActive: true,
        name: nameCtrl.text,
        route: routerCtrl.text,
      ),
    );
    await callDataService(
      handle,
      onSuccess: (response) {
        showSuccessToast('Thêm category thành công');
        imageDesCtrl.clear();
        nameCtrl.clear();
        routerCtrl.clear();
        context.pop();
        getAllCategories();
      },
    );
  }

  void deleteCate(CategoryEntity cate) async {
    var handle = _locationUsecase.deleteCategory(id: cate.catId ?? -1);
    await callDataService(
      handle,
      onSuccess: (v) {
        showSuccessToast('Xoá thành công');
        getAllCategories();
      },
    );
  }
}
