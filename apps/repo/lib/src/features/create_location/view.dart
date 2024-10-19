import 'dart:math';

import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/create_advert/cubit.dart';
import 'package:repo/src/features/create_advert/state.dart';
import 'package:repo/src/features/create_advert/view.dart';
import 'package:repo/src/features/create_location/cubit.dart';
import 'package:repo/src/features/create_location/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:repo/src/utils/validate.dart';
import 'package:repo/src/values/colors.dart';
import 'package:repo/src/widgets/advert_search_dropdown.dart';
import 'package:repo/src/widgets/image_preview.dart';
import 'package:template/template.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class CreateLocationView extends StatefulWidget {
  CreateLocationView({
    super.key,
    this.locationId,
  });
  int? locationId;
  @override
  State<CreateLocationView> createState() => _CreateLocationViewState();
}

class _CreateLocationViewState extends State<CreateLocationView> {
  final _cubit = Injector.instance<CreateLocationCubit>();
  final _advertFormKey = GlobalKey<FormState>();
  final _locationFormKey = GlobalKey<FormState>();

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
        builder: (context, state) {
          return BlocBuilder<CreateLocationCubit, CreateLocationState>(
            buildWhen: (previous, current) =>
                previous.processIndex != current.processIndex,
            builder: (context, state) {
              return Column(
                children: [
                  _renderSteps(),
                  if (state.processIndex == 0)
                    _renderCreateLocation()
                  else if (state.processIndex == 1)
                    _renderCategory()
                  else if (state.processIndex == 2)
                    _renderAdverts()
                  else
                    _renderFinish(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<StepTimeLine> _processes = [
    StepTimeLine(
      iconData: Icons.location_on,
      name: 'Tạo vị trí',
    ),
    StepTimeLine(
      iconData: Icons.picture_in_picture,
      name: 'Gắn vị trí',
    ),
    StepTimeLine(
      iconData: Icons.branding_watermark,
      name: 'Chọn quảng cáo',
    ),
    StepTimeLine(
      iconData: Icons.done,
      name: 'Hoàn thành',
    ),
  ];

  Widget _renderSteps() {
    return Container(
      width: Utils.getWidth(context) * 0.6,
      height: 100,
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          direction: Axis.horizontal,
          connectorTheme: const ConnectorThemeData(
            space: 30.0,
            thickness: 4.0,
          ),
        ),
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemExtentBuilder: (_, __) =>
              Utils.getWidth(context) * 0.6 / _processes.length,
          oppositeContentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Icon(
                _processes[index].iconData,
                size: 24,
                color: getColor(index),
              ),
            );
          },
          contentsBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                _processes[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: getColor(index),
                ),
              ),
            );
          },
          indicatorBuilder: (_, index) {
            Color color;
            Widget? child;
            if (index == _cubit.state.processIndex) {
              color = inProgressColor;
              child = Container(
                // padding: EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 15.0,
                ),
              );
            } else if (index < _cubit.state.processIndex) {
              color = completeColor;
              child = const Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0,
              );
            } else {
              color = todoColor;
            }

            if (index <= _cubit.state.processIndex) {
              return Stack(
                children: [
                  CustomPaint(
                    size: const Size(22, 22),
                    painter: BezierPainter(
                      color: color,
                      drawStart: index > 0,
                      drawEnd: index < _cubit.state.processIndex,
                    ),
                  ),
                  DotIndicator(
                    size: 22.0,
                    color: color,
                    child: child ?? Container(),
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomPaint(
                    size: Size(15.0, 15.0),
                    painter: BezierPainter(
                      color: color,
                      drawEnd: index < _processes.length - 1,
                    ),
                  ),
                  OutlinedDotIndicator(
                    borderWidth: 4.0,
                    color: color,
                  ),
                ],
              );
            }
          },
          connectorBuilder: (_, index, type) {
            if (index > 0) {
              if (index == _cubit.state.processIndex) {
                final prevColor = getColor(index - 1);
                final color = getColor(index);
                List<Color> gradientColors;
                if (type == ConnectorType.start) {
                  gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                } else {
                  gradientColors = [
                    prevColor,
                    Color.lerp(prevColor, color, 0.5)!
                  ];
                }
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: gradientColors,
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: getColor(index),
                );
              }
            } else {
              return null;
            }
          },
          itemCount: _processes.length,
        ),
      ),
    );
  }

  Widget _renderCreateLocation() {
    return BlocBuilder<CreateLocationCubit, CreateLocationState>(
      builder: (context, state) {
        return Container(
          width: Utils.getWidth(context) * 0.6,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: _advertFormKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppTextField(
                        isRequired: true,
                        controller: _cubit.nameCtrl,
                        hintText: 'Nhập tên vị trí',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Tên vị trí',
                        validator: (p0) {
                          return Validator().notEmpty(p0, 'Tên vị trí');
                        },
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: AppTextField(
                        controller: _cubit.tagCtrl,
                        hintText: 'Tag',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Tag',
                        // validator: (p0) {
                        //   return Validator().notEmpty(
                        //     p0,
                        //     'Tag',
                        //   );
                        // },
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        isRequired: true,
                        controller: _cubit.widthCtrl,
                        hintText: 'Chiều rộng',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Chiều rộng',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (p0) {
                          return Validator().notEmpty(
                            p0,
                            'Chiều rộng',
                          );
                        },
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: AppTextField(
                        isRequired: true,
                        controller: _cubit.height,
                        hintText: 'Chiều dài',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Chiều dài',
                        validator: (p0) {
                          return Validator().notEmpty(
                            p0,
                            'Chiều dài',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: AppTextField(
                        isRequired: false,
                        maxLines: 4,
                        controller: _cubit.imgDesCtrl,
                        hintText: 'Nhập link mô tả',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Link ảnh mô tả',
                        // validator: (p0) {
                        //   return Validator().notEmpty(p0, 'Mô tả');
                        // },
                      ),
                    ),
                  ],
                ),
                const Gap(22),
                Align(
                  child: PrimaryButton(
                    labelText: widget.locationId == null
                        ? 'Tạo vị trí'
                        : 'Cập nhật nhật vị trí',
                    onPressed: () {
                      if (_advertFormKey.currentState!.validate()) {
                        if (widget.locationId == null) {
                          _cubit.createLocation();
                        } else {
                          _cubit.updateLocation();
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _renderCategory() {
    return Form(
      key: _locationFormKey,
      child: Container(
        width: Utils.getWidth(context) * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<CreateLocationCubit, CreateLocationState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchDropdown<CategoryEntity>(
                  typeDropdown: TypeDropdown.multi_search,
                  validator: (v) {
                    if ((v as List).isEmpty) return 'Không được bỏ trống';
                  },
                  width: double.infinity,
                  multiSelectController: _cubit.categoryCtrl,
                  isRequired: true,
                  enable: true,
                  title: 'Chọn category',
                  builderItems: (context, t, isSelected, listItemBuilder) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (t as CategoryEntity).name ?? '',
                          style: const TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    );
                  },
                  values: _cubit.state.categoies,
                  // initialItems: _cubit.categoryCtrl?.value ?? [],
                  renderItem: (t) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (t as CategoryEntity).name ?? '',
                          style: const TextStyle(color: AppColors.primaryColor),
                        ),
                      ],
                    );
                  },
                  hintText: 'Chọn ',
                  onListChanged: (v, {isDelete}) {
                    _cubit.onChangedCategory(v as List<CategoryEntity>);
                  },
                  onDelete: (v) {
                    _cubit.deleteCate(v as CategoryEntity?);
                  },
                  // onChanged: (v) {
                  //   _cubit.onChangedLocation(v as LocationEntity?);
                  // },
                ),
                const Gap(12),
                Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryButton(
                    labelText: "Gắn",
                    onPressed: () {
                      if (_locationFormKey.currentState!.validate()) {
                        _cubit.pinCategory();
                      }
                    },
                  ),
                ),
                const Gap(12),
                if (state.categoiesSelected.isNotEmpty)
                  const Text(
                    'Category được chọn',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                const Gap(12),
                Container(
                  constraints:
                      const BoxConstraints(minHeight: 30, maxHeight: 300),
                  child: ListView.builder(
                    itemCount: state.categoiesSelected.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (state.categoiesSelected.isEmpty) return Container();
                      CategoryEntity l = state.categoiesSelected[index];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              AppBoxShadow.ksSmallShadow(),
                            ]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                l.name ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            if (l.imgDesc != null && l.imgDesc!.isNotEmpty)
                              ImagePreviewWidget(
                                width: 70,
                                height: 70,
                                imageUrl: l.imgDesc!,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _renderAdverts() {
    return Container(
      width: Utils.getWidth(context) * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocBuilder<CreateLocationCubit, CreateLocationState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdvertSearchDropdown(
                typeDropdown: TypeDropdown.multi_search_request,
                multiSelectController: _cubit.advertsCtrl,
                onListChanged: (v, {isDelete}) {
                  _cubit.onChangeAdverts(v as List<AdvertEntity>);
                },
                onDelete: (v) {
                  _cubit.deleteAdvert(v as AdvertEntity);
                },
              ),
              const Gap(12),
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryButton(
                  labelText: "Tiếp tục",
                  onPressed: () {
                    _cubit.pinAdvert();
                  },
                ),
              ),
              const Gap(12),
              if (state.advertsSelected.isNotEmpty)
                const Text(
                  'Quảng cáo được chọn',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              const Gap(12),
              Container(
                constraints:
                    const BoxConstraints(minHeight: 30, maxHeight: 300),
                child: ListView.builder(
                  itemCount: state.advertsSelected.length,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (state.advertsSelected.isEmpty) return Container();
                    AdvertEntity l = state.advertsSelected[index];
                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 144, 176, 255),
                                  Color.fromARGB(255, 116, 130, 255),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                AppBoxShadow.ksSmallShadow(),
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  l.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              if (l.url != null && l.url!.isNotEmpty)
                                ImagePreviewWidget(
                                  width: 70,
                                  height: 70,
                                  imageUrl: l.url!,
                                ),
                            ],
                          ),
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              _cubit.deleteAdvert(l);
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          top: 2,
                          right: 2,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _renderFinish() {
    return Container(
      width: Utils.getWidth(context) * 0.6,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Tạo vị trí và gán thành công',
            style: TextStyle(
              color: inProgressColor,
              fontSize: 16,
            ),
          ),
          const Gap(12),
          PrimaryButton(
            labelText: 'Hoàn tất',
            onPressed: () {
              _cubit.clear();
            },
          )
        ],
      ),
    );
  }

  Color getColor(int index) {
    if (index == _cubit.state.processIndex) {
      return inProgressColor;
    } else if (index < _cubit.state.processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }
}
