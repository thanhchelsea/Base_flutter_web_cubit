import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/create_advert/cubit.dart';
import 'package:repo/src/features/create_advert/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:repo/src/utils/validate.dart';
import 'package:repo/src/values/colors.dart';
import 'package:repo/src/widgets/image_preview.dart';
import 'package:tab_container/tab_container.dart';
import 'package:template/template.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

List<String> advertRaito = [
  '16x9',
  '9x16',
  '1x1',
];

class CreateAdvertView extends StatefulWidget {
  CreateAdvertView({
    super.key,
    this.advertId,
  });
  int? advertId;
  @override
  State<CreateAdvertView> createState() => _CreateAdvertViewState();
}

class _CreateAdvertViewState extends State<CreateAdvertView>
    with TickerProviderStateMixin {
  final _cubit = Injector.instance<CreateAdvertCubit>();
  final _advertFormKey = GlobalKey<FormState>();
  final _locationCateFormKey = GlobalKey<FormState>();
  final _locationRaitoFormKey = GlobalKey<FormState>();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    // tabController.addListener(() {
    //   if (tabController.indexIsChanging) {
    //     // _cubit.clearLocaiton();
    //     // _cubit.cateCtrl?.clear();
    //     // _cubit.raitoCtrl?.clear();
    //   }
    // });
    _cubit.startGetData(widget.advertId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BaseView(
        cubit: _cubit,
        builder: (context, state) {
          return BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
            buildWhen: (previous, current) =>
                previous.processIndex != current.processIndex,
            builder: (context, state) {
              return Column(
                children: [
                  _renderSteps(),
                  if (state.processIndex == 0)
                    _renderCreateAdvert()
                  else if (state.processIndex == 1)
                    _renderLocation()
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

  final List<StepTimeLine> _processes = [
    StepTimeLine(
      iconData: Icons.confirmation_number_outlined,
      name: 'Tạo quảng cáo',
    ),
    StepTimeLine(
      iconData: Icons.picture_in_picture,
      name: 'Gắn quảng cáo',
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

  Widget _renderCreateAdvert() {
    return BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppTextField(
                        isRequired: true,
                        controller: _cubit.nameCtrl,
                        hintText: 'Nhập tên quảng cáo',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Tên quảng cáo',
                        validator: (p0) {
                          return Validator().notEmpty(p0, 'Tên quảng cáo');
                        },
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: AppTextField(
                        isRequired: true,
                        controller: _cubit.urlCtrl,
                        hintText: 'Url',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Url',
                        validator: (p0) {
                          return Validator().notEmpty(
                            p0,
                            'Url',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: DatePickerField(
                        title: 'Ngày bắt đầu',
                        isRequired: true,
                        initDate: state.startDate,
                        onChanged: (v) {
                          _cubit.updateStartDate(v as DateTime?);
                        },
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: DatePickerField(
                        title: 'Ngày kết thúc',
                        isRequired: true,
                        initDate: state.endDate,
                        onChanged: (v) {
                          _cubit.updateEndDate(v as DateTime?);
                        },
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
                        controller: _cubit.openUrlCtrl,
                        hintText: 'Click action',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Click action',
                        validator: (p0) {
                          return Validator().notEmpty(p0, 'Click action');
                        },
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: AppTextField(
                        isRequired: false,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Loại',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(4),
                        Row(
                          children: [
                            AppRadio<int>(
                              value: 0,
                              groupValue: state.adsType ?? 0,
                              onChanged: (v) {
                                _cubit.onChangAdsType(v as int);
                              },
                              title: const Text('Ảnh'),
                            ),
                            const Gap(16),
                            AppRadio<int>(
                              value: 1,
                              groupValue: state.adsType ?? 0,
                              onChanged: (v) {
                                _cubit.onChangAdsType(v as int);
                              },
                              title: const Text('Video'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Trạng thái',
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Gap(4),
                        Row(
                          children: [
                            AppRadio<bool>(
                              value: true,
                              groupValue: state.isPublish ?? true,
                              onChanged: (v) {
                                _cubit.onChangIsPublic(v as bool);
                              },
                              title: const Text('Phát hành'),
                            ),
                            const Gap(16),
                            AppRadio<bool>(
                              value: false,
                              groupValue: state.isPublish ?? false,
                              onChanged: (v) {
                                _cubit.onChangIsPublic(v as bool);
                              },
                              title: const Text('Ẩn'),
                            ),
                          ],
                        ),
                      ],
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
                        controller: _cubit.desCtrl,
                        hintText: 'Nhập mô tả',
                        backgroundColor: Colors.white,
                        borderColor: Colors.transparent,
                        title: 'Mô tả',
                        // validator: (p0) {
                        //   return Validator().notEmpty(p0, 'Mô tả');
                        // },
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                Container(
                  width: 500,
                  child: AppTextField(
                    isRequired: false,
                    controller: _cubit.userTestCtrl,
                    hintText: 'Nhập userID',
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    title: 'Nhập user được phép thấy quảng cáo khi chưa public',
                    // validator: (p0) {
                    //   return Validator().notEmpty(p0, 'Mô tả');
                    // },
                  ),
                ),
                const Gap(22),
                Align(
                  child: PrimaryButton(
                    labelText: 'Tiếp tục',
                    onPressed: () {
                      if (_advertFormKey.currentState!.validate()) {
                        if (widget.advertId == null) {
                          _cubit.createAdvert();
                        } else {
                          _cubit.updateAdvert();
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

  Widget _renderLocation() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TabContainer(
        controller: tabController,
        tabEdge: TabEdge.left,
        tabsStart: 0.2,
        tabsEnd: 0.9,
        tabMaxLength: 100,
        tabExtent: 80,
        borderRadius: BorderRadius.circular(10),
        tabBorderRadius: BorderRadius.circular(10),
        childPadding: const EdgeInsets.all(12),
        selectedTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
        unselectedTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13.0,
        ),
        colors: const [
          Color.fromARGB(255, 244, 127, 127),
          Color.fromARGB(255, 130, 214, 133),
          // Colors.blue,
        ],
        tabs: const [
          Text('Category'),
          Text('Raito'),
        ],
        children: [
          _renderCategory(),
          _renderRaito(),
        ],
      ),
    );
  }

  Widget _renderCategory() {
    return Form(
      key: _locationCateFormKey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
          builder: (context, state) {
            return Column(
              children: [
                SearchDropdown<CategoryEntity>(
                  typeDropdown: TypeDropdown.normal,
                  // validator: (v) {
                  //   if (v == null) return 'Không được bỏ trống';
                  // },
                  initValue: null,
                  width: double.infinity,
                  singleSelectController: _cubit.cateCtrl,
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
                  values: _cubit.state.categories,
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
                  hintText: 'Chọn category',
                  onChanged: (v) {
                    _cubit.onCateLocationSelected(v as CategoryEntity?);
                  },
                  // onChanged: (v) {
                  //   _cubit.onChangedLocation(v as LocationEntity?);
                  // },
                ),
                _renderLocationSetlected(
                    state.locationsCateSelected, _cubit.locationCateCtrl, (v) {
                  _cubit.onChangedLocationCate(v as List<LocationEntity>);
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _renderRaito() {
    return Form(
      key: _locationRaitoFormKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SearchDropdown<String>(
                      typeDropdown: TypeDropdown.normal,
                      // validator: (v) {
                      //   if (v == null) return 'Không được bỏ trống';
                      // },
                      width: double.infinity,
                      singleSelectController: _cubit.raitoCtrl,
                      isRequired: true,
                      enable: true,
                      title: 'Chọn tỉ lệ',
                      builderItems: (context, t, isSelected, listItemBuilder) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.toString(),
                              style: const TextStyle(
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        );
                      },
                      values: advertRaito,
                      renderItem: (t) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.toString(),
                              style: const TextStyle(
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        );
                      },
                      hintText: 'Chọn tỉ lệ',
                      onChanged: (v) {
                        _cubit.onRaitoSelected(v as String?);
                      },
                      // onChanged: (v) {
                      //   _cubit.onChangedLocation(v as LocationEntity?);
                      // },
                    ),
                    _renderLocationSetlected(
                        state.locationsRaitoSelected, _cubit.locationRaitoCtrl,
                        (v) {
                      _cubit.onChangedLocationRaito(
                        v as List<LocationEntity>,
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<LocationEntity> removeDuplicatesById(List<LocationEntity> list) {
    Set<int> seenIds = {};
    List<LocationEntity> uniqueList = [];

    for (var item in list) {
      if (!seenIds.contains(item.locationId)) {
        seenIds.add(item.locationId ?? -1);
        uniqueList.add(item);
      }
    }

    return uniqueList;
  }

  Widget _renderLocationSetlected(
    List<LocationEntity> locations,
    MultiSelectController<LocationEntity>? controller,
    Function onChange,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
            builder: (context, state) {
              // if (state.locations.isEmpty) return Container();
              return SearchDropdown<LocationEntity>(
                typeDropdown: TypeDropdown.multi_search,
                // validator: (v) {
                //   print("dmdmdm ${state.locationsSelected.length}");
                //   if (state.locationsSelected.isNotEmpty) return null;
                //   if ((v as List).isEmpty) return 'Không được bỏ trống';
                // },
                width: double.infinity,
                multiSelectController: controller,
                isRequired: true,
                enable: true,
                title: 'Chọn vị trí',
                builderItems: (context, t, isSelected, listItemBuilder) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (t as LocationEntity).name ?? '',
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  );
                },
                values: _cubit.state.locations,
                renderItem: (t) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (t as LocationEntity).name ?? '',
                        style: const TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  );
                },
                hintText: 'Chọn vị trí',
                onListChanged: (v, {isDelete}) {
                  onChange(v);
                },
              );
            },
          ),
          BlocBuilder<CreateAdvertCubit, CreateAdvertState>(
            buildWhen: (previous, current) =>
                previous.locationsSelected != current.locationsSelected ||
                previous.locationsCateSelected !=
                    current.locationsCateSelected ||
                previous.locationsRaitoSelected !=
                    current.locationsRaitoSelected,
            builder: (context, state) {
              List<LocationEntity> dataLocationsSelected = [
                ...state.locationsSelected,
                ...locations,
              ]..toSet().toList();
              dataLocationsSelected =
                  removeDuplicatesById(dataLocationsSelected);
              if (dataLocationsSelected.isEmpty) return Container();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryButton(
                      labelText: 'Tiếp tục',
                      onPressed: () {
                        _cubit.next();
                      },
                    ),
                  ),
                  const Gap(12),
                  const Text(
                    'Vị trí được chọn',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Gap(12),
                  Container(
                    constraints:
                        const BoxConstraints(minHeight: 30, maxHeight: 300),
                    child: ListView.builder(
                      itemCount: dataLocationsSelected.length,
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (dataLocationsSelected.isEmpty) return Container();
                        LocationEntity l = dataLocationsSelected[index];
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
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              InkWell(
                                onTap: () {
                                  _cubit.deleteLocation(l);
                                },
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.redAccent,
                                ),
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
          )
        ],
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
            'Tạo quảng cáo và gán thành công',
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

class StepTimeLine {
  String name;
  IconData iconData;
  StepTimeLine({required this.iconData, required this.name});
}

class BezierPainter extends CustomPainter {
  const BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    double angle;
    Offset offset1;
    Offset offset2;

    Path path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius, radius)
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
            size.width, size.height / 2, size.width + radius, radius)
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
