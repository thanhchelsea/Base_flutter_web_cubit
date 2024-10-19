import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/advert_detail/cubit.dart';
import 'package:repo/src/features/advert_detail/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:repo/src/values/colors.dart';
import 'package:repo/src/widgets/image_preview.dart';
import 'package:template/template.dart';

class AdvertDetailView extends StatefulWidget {
  AdvertDetailView({
    super.key,
    required this.advertId,
  });

  int advertId;
  @override
  State<AdvertDetailView> createState() => _AdvertDetailViewState();
}

class _AdvertDetailViewState extends State<AdvertDetailView> {
  final _cubit = Injector.instance<AdvertDetailCubit>();

  @override
  void initState() {
    _cubit.startGetData(widget.advertId);
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
          return BlocBuilder<AdvertDetailCubit, AdvertDetailState>(
            builder: (context, state) {
              if (state.advert == null) return Container();
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _renderAdvertDetail(),
                    const Gap(12),
                    _renderLocation(),
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
            '${AppRoutes.advertPath}/${AppRoutes.editAdddvertPath}?advertId=${_cubit.state.advert?.advert?.advertId}');
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

  Widget _renderAdvertDetail() {
    return BlocBuilder<AdvertDetailCubit, AdvertDetailState>(
      builder: (context, state) {
        if (state.advert == null) return Container();
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
                state.advert?.advert!.name ?? '',
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
                          data:
                              state.advert?.advert!.advertId?.toString() ?? '',
                          isVertical: false,
                          title: 'Id:',
                        ),
                        const Gap(4),
                        InfoItem(
                          data:
                              state.advert?.advert!.getTypeName().toString() ??
                                  '',
                          isVertical: false,
                          title: 'Loại:',
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      children: [
                        InfoItem(
                          data: state.advert?.advert!.startDate
                                  ?.formatDateTimeToddMMyyyy() ??
                              '',
                          isVertical: false,
                          title: 'Ngày bắt đầu :',
                        ),
                        const Gap(4),
                        InfoItem(
                          data: state.advert?.advert!.endDate
                                  ?.formatDateTimeToddMMyyyy() ??
                              '',
                          isVertical: false,
                          title: 'Ngày kết thúc:',
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        InfoItem(
                          data: state.advert?.advert!.isPublish == true
                              ? 'Đã phát hành'
                              : 'Chưa phát hành',
                          isVertical: false,
                          title: 'Phát hành:',
                          colorText: state.advert?.advert!.isPublish == true
                              ? Colors.green
                              : Colors.black38,
                          colorTitle: state.advert?.advert!.isPublish == true
                              ? Colors.green
                              : Colors.black38,
                        ),
                        const Gap(4),
                        InfoItem(
                          data: state.advert?.advert!.isActive == true
                              ? 'Đã kích hoạt'
                              : 'Chưa kích hoạt',
                          isVertical: false,
                          title: 'Kích hoạt:',
                          colorText: state.advert?.advert!.isActive == true
                              ? Colors.green
                              : Colors.black38,
                          colorTitle: state.advert?.advert!.isActive == true
                              ? Colors.green
                              : Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(4),
              InfoItem(
                data: state.advert?.advert!.openUrl.toString() ?? '',
                isVertical: false,
                title: 'Open Url:',
              ),
              const Gap(4),
              InfoItem(
                data: state.advert?.advert!.descriptions.toString() ?? '',
                isVertical: false,
                maxLine: 10,
                title: 'Mô tả:',
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
                imageUrl: state.advert?.advert!.url ?? '',
              )
            ],
          ),
        );
      },
    );
  }

  Widget _renderLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Danh sách vị trí được gán',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const Gap(12),
        Wrap(
          children: List.generate(
            _cubit.state.advert?.locations?.length ?? 0,
            (index) {
              LocationEntity location = _cubit.state.advert!.locations![index];
              return InkWell(
                onTap: () {
                  context.go(
                    '${AppRoutes.locationPath}/${AppRoutes.locationDetailPath}?locationId=${location.locationId}',
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
                              data: location.locationId.toString(),
                              title: 'Id:',
                              isVertical: false,
                            ),
                          ),
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      const Gap(12),
                      InfoItem(
                        data: location.name ?? '',
                        title: 'Tên:',
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
}
