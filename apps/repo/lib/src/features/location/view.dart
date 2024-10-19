import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/location/cubit.dart';
import 'package:repo/src/features/location/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:template/template.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final _cubit = Injector.instance<LocationCubit>();

  @override
  void initState() {
    _cubit.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BaseView(
        cubit: _cubit,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(child: _renderLocations()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _renderLocations() {
    return BlocBuilder<LocationCubit, LocationState>(
      buildWhen: (previous, current) => previous.locations != current.locations,
      builder: (context, state) {
        return DataTableCustom(
          scrollController: _cubit.scrollController,
          onLoadMore: () {
            _cubit.getAllLocation(isLoadMore: true);
          },
          columns: genDataColumnFromLicense(),
          rows: List.generate(
            state.locations.length,
            (index) {
              var location = state.locations[index];
              return DataRow(
                onSelectChanged: (value) {
                  context.go(
                    '${AppRoutes.locationPath}/${AppRoutes.locationDetailPath}?locationId=${location.locationId}',
                  );
                },
                cells: [
                  DataCell(
                    Text(location.locationId.toString()),
                  ),
                  DataCell(
                    Text(location.name ?? ''),
                  ),
                  DataCell(
                    Text(location.width.toString()),
                  ),
                  DataCell(
                    Text(
                      location.height.toString(),
                    ),
                  ),
                  DataCell(
                    Text(location.createdBy.toString()),
                  ),
                  DataCell(
                    Text(
                      location.createdAt?.formatDateTimeToddMMyyyy() ?? '',
                    ),
                  ),
                  DataCell(
                    Text(location.tag.toString()),
                  ),
                  DataCell(
                    MenuAnchorCustom(
                      onTapDelete: () {
                        Utils.showBaseDialog(
                          width: 500,
                          context: this.context,
                          dialogType: DialogType.confirm,
                          title: 'Xoá',
                          content: 'Xoá vị trí quảng cáo',
                          onRightButtonClick: () async {
                            _cubit.deleteLocation(location);
                            context.pop();
                          },
                        );
                      },
                      onTapEdit: () {
                        // context.go(
                        //     '${AppRoutes.locationPath}/${AppRoutes.edit}?advertId=${advert.advertId}');
                      },
                      items: [
                        // MenuAnchorItem(
                        //   title: 'Tạo đơn in',
                        //   icon: const Icon(
                        //     Icons.add_box_outlined,
                        //     color: Colors.white,
                        //     size: 16,
                        //   ),
                        //   onTap: () {
                        //     context.go(
                        //       '${AppRoutes.printOrderPath}/${AppRoutes.createPrintOrderPath}?printLicenseId=${tran.printLicenseId}&productId=${tran.productId}',
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  List<DataColumn2> genDataColumnFromLicense() {
    var data = <DataColumn2>[
      const DataColumn2(label: Text('Id'), fixedWidth: 50),
      const DataColumn2(
        label: Text('Tên'),
        // fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('Width'),
        fixedWidth: Utils.getWidth(context) * 0.05,
      ),
      DataColumn2(
        label: Text('height'),
        fixedWidth: Utils.getWidth(context) * 0.05,
      ),
      DataColumn2(
        label: const Text('Người tạo'),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('Ngày tạo'),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('tag'),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text(''),
        fixedWidth: 40,
      ),
    ];

    return data;
  }
}
