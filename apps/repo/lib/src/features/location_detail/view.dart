import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/location_detail/cubit.dart';
import 'package:repo/src/features/location_detail/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:repo/src/values/colors.dart';
import 'package:repo/src/widgets/image_preview.dart';
import 'package:template/template.dart';

class LocaionDetailDetailView extends StatefulWidget {
  LocaionDetailDetailView({
    super.key,
    required this.locationId,
  });

  int locationId;
  @override
  State<LocaionDetailDetailView> createState() =>
      _LocaionDetailDetailViewState();
}

class _LocaionDetailDetailViewState extends State<LocaionDetailDetailView> {
  final _cubit = Injector.instance<LocationDetailCubit>();

  @override
  void initState() {
    _cubit.startGetData(widget.locationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BaseView(
        cubit: _cubit,
        appBarActions: [_renderActions()],
        builder: (context, state) {
          return BlocBuilder<LocationDetailCubit, LocationDetailState>(
            builder: (context, state) {
              if (state.location == null) return Container();
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _renderLocationDetail(),
                    const Gap(12),
                    _renderAdverts(),
                    const Gap(12),
                    _renderCategory(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _renderActions() {
    return PrimaryButton(
      labelText: '',
      onPressed: () {
        context.go(
            '${AppRoutes.locationPath}/${AppRoutes.editLocationPath}?locationId=${_cubit.state.location?.location?.locationId}');
      },
      padding: const EdgeInsets.all(0),
      borderRadius: 8,
      titleWidget: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }

  Widget _renderLocationDetail() {
    return BlocBuilder<LocationDetailCubit, LocationDetailState>(
      builder: (context, state) {
        if (state.location == null) return Container();
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.location?.location!.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const Gap(12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        InfoItem(
                          data: state.location?.location!.locationId
                                  ?.toString() ??
                              '',
                          isVertical: false,
                          title: 'Id:',
                        ),
                        const Gap(4),
                        InfoItem(
                          data: state.location?.location?.isActive == true
                              ? 'Đã kích hoạt'
                              : 'Chưa kích hoạt',
                          isVertical: false,
                          title: 'Kích hoạt:',
                          colorText: state.location?.location?.isActive! == true
                              ? Colors.green
                              : Colors.black38,
                          colorTitle:
                              state.location?.location?.isActive! == true
                                  ? Colors.green
                                  : Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      children: [
                        InfoItem(
                          data:
                              state.location?.location?.width?.toString() ?? '',
                          isVertical: false,
                          title: 'Chiều rộng:',
                        ),
                        const Gap(4),
                        InfoItem(
                          data: state.location?.location?.height?.toString() ??
                              '',
                          isVertical: false,
                          title: 'Chiều dài:',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        InfoItem(
                          data: state.location?.location?.sumView?.toString() ??
                              '',
                          isVertical: false,
                          title: 'Tổng lượt view:',
                        ),
                        const Gap(4),
                        InfoItem(
                          data:
                              state.location?.location?.sumClick?.toString() ??
                                  '',
                          isVertical: false,
                          title: 'Tổng lượt click:',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(4),
              InfoItem(
                data: state.location?.location!.tag.toString() ?? '',
                isVertical: false,
                title: 'Tag:',
              ),
              const Gap(4),
              const Text(
                'Ảnh mô tả:',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),
              const Gap(4),
              ImagePreviewWidget(
                // width: Utils.getWidth(context) * 0.6,
                height: 250,
                imageUrl: state.location?.location?.imgDesc ?? '',
              )
            ],
          ),
        );
      },
    );
  }

  Widget _renderAdverts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Danh sách quảng cáo được gắn',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const Gap(12),
        Wrap(
          children: List.generate(
            _cubit.state.adverts?.length ?? 0,
            (index) {
              AdvertEntity advert = _cubit.state.adverts[index];
              return InkWell(
                onTap: () {
                  context.go(
                    '${AppRoutes.advertPath}/${AppRoutes.advertDetailPath}?advertId=${advert.advertId}',
                  );
                },
                child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 100, maxWidth: 300),
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InfoItem(
                              data: advert.advertId.toString(),
                              title: 'Id:',
                              isVertical: false,
                            ),
                          ),
                          const Icon(
                            Icons.branding_watermark,
                            size: 14,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const Gap(12),
                      InfoItem(
                        data: advert.name ?? '',
                        title: 'Tên:',
                        isVertical: false,
                      ),
                      InfoItem(
                        data: advert.getTypeName(),
                        title: 'Loại:',
                        isVertical: false,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _renderCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nằm trong categoies: ',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const Gap(12),
        Wrap(
          children: List.generate(
            _cubit.state.location?.categories?.length ?? 0,
            (index) {
              CategoryEntity cate = _cubit.state.location!.categories![index];
              return Container(
                constraints: const BoxConstraints(minWidth: 100, maxWidth: 300),
                margin: const EdgeInsets.only(right: 10, top: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InfoItem(
                            data: cate.catId.toString(),
                            title: 'Id:',
                            isVertical: false,
                          ),
                        ),
                        const Icon(
                          Icons.category,
                          size: 14,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                    const Gap(12),
                    InfoItem(
                      data: cate.name ?? '',
                      title: 'Tên:',
                      isVertical: false,
                    ),
                    InfoItem(
                      data: cate.route ?? '',
                      title: 'Route:',
                      isVertical: false,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
