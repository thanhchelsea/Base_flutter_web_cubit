import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/advert/domain/usecase/advert_usecase.dart';
import 'package:common_features/base_model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/values/colors.dart';

import 'package:template/template.dart';

class AdvertSearchDropdown extends StatelessWidget {
  AdvertSearchDropdown({
    super.key,
    this.productSelected,
    this.onChanged,
    this.showTitle = true,
    this.isRequired = true,
    this.validator,
    this.isEnable = true,
    this.showShadow = true,
    this.canCloseOutsideBounds = true,
    this.overlayHeight = 500,
    this.typeDropdown = TypeDropdown.search,
    this.onListChanged,
    this.initialItems,
    this.currentValues,
    this.multiSelectController,
    this.onDelete,
  });
  AdvertEntity? productSelected;
  Function? onChanged;
  bool showTitle;
  bool isRequired;
  String? Function(AdvertEntity?)? validator;
  bool isEnable;
  bool canCloseOutsideBounds;
  double? overlayHeight;
  Function(dynamic)? onDelete;

  TypeDropdown typeDropdown;
  Function(List<dynamic>, {bool? isDelete})? onListChanged;
  List<AdvertEntity>? initialItems;
  List<AdvertEntity>? currentValues;
  MultiSelectController<AdvertEntity>? multiSelectController;
  final AdvertUsecase _advertUsecase = Injector.instance();
  bool showShadow;
  Future<List<AdvertEntity>> getAdverts(
    String? searchValue,
  ) async {
    var data =
        await _advertUsecase.getAdvertWithSearchValue(keyword: searchValue);
    return data.data ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnable,
      child: SearchDropdown<AdvertEntity>(
        enable: isEnable,
        onDelete: onDelete,
        multiSelectController: multiSelectController,
        canCloseOutsideBounds: canCloseOutsideBounds,
        overlayHeight: overlayHeight,
        showShadow: showShadow,
        width: double.infinity,
        isRequired: isRequired,
        title: showTitle ? 'Quảng cáo' : null,
        typeDropdown: typeDropdown, // TypeDropdown.search,
        onListChanged: onListChanged,
        initialItems: initialItems,
        validator: (v) {
          if (validator != null) {
            return validator!(v as AdvertEntity?);
          }
          return null;
        },
        builderItems: (context, t, isSelected, listItemBuilder) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (t as AdvertEntity).name ?? '',
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          );
        },
        renderItem: (t) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (t as AdvertEntity).name ?? '',
                style: const TextStyle(color: AppColors.primaryColor),
              ),
            ],
          );
        },
        getProductFunc: getAdverts,
        hintText: 'Tìm kiếm quảng cáo',
        onChanged: (v) {
          onChanged?.call(v);
        },
      ),
    );
  }
}
