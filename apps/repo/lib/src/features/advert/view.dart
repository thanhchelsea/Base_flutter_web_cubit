import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/advert/cubit.dart';
import 'package:repo/src/features/advert/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:template/template.dart';

class AdvertView extends StatefulWidget {
  const AdvertView({super.key});

  @override
  State<AdvertView> createState() => _AdvertViewState();
}

class _AdvertViewState extends State<AdvertView> {
  final _cubit = Injector.instance<AdvertCubit>();

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
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(child: _renderAdverets()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _renderAdverets() {
    return BlocBuilder<AdvertCubit, AdvertState>(
      buildWhen: (previous, current) => previous.adverts != current.adverts,
      builder: (context, state) {
        return DataTableCustom(
          scrollController: _cubit.scrollController,
          onLoadMore: () {
            _cubit.getAllLocation(isLoadMore: true);
          },
          columns: genDataColumnFromLicense(),
          rows: List.generate(
            state.adverts.length,
            (index) {
              var advert = state.adverts[index];
              return DataRow(
                onSelectChanged: (value) {
                  context.go(
                      '${AppRoutes.advertPath}/${AppRoutes.advertDetailPath}?advertId=${advert.advertId}');
                },
                color: WidgetStatePropertyAll(
                  (advert.isPublish! && advert.isActive! ?? false)
                      ? null
                      : Colors.redAccent.withOpacity(0.1),
                ),
                cells: [
                  DataCell(
                    Text(advert.advertId.toString()),
                  ),
                  DataCell(
                    Text(advert.name ?? ''),
                  ),
                  DataCell(
                    Text(
                      advert.descriptions.toString(),
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(advert.getTypeName().toString()),
                  ),
                  DataCell(
                    Text(
                      advert.openUrl.toString(),
                    ),
                  ),
                  DataCell(
                    Text(advert.startDate?.formatDateTimeToddMMyyyy() ?? ''),
                  ),
                  DataCell(
                    Text(advert.endDate?.formatDateTimeToddMMyyyy() ?? ''),
                  ),
                  DataCell(
                    Text(advert.createdBy.toString()),
                  ),
                  DataCell(
                    Text(advert.tag.toString()),
                  ),
                  // DataCell(
                  //   Text(location.createdAt?.formatDateTimeToddMMyyyy() ?? ''),
                  // ),
                  DataCell(
                    MenuAnchorCustom(
                      onTapDelete: () {
                        Utils.showBaseDialog(
                          width: 500,
                          context: this.context,
                          dialogType: DialogType.confirm,
                          title: 'Xoá',
                          content: 'Xoá quảng cáo',
                          onRightButtonClick: () async {
                            _cubit.deleteAdvert(advert);
                            context.pop();
                          },
                        );
                      },
                      onTapEdit: () {
                        context.go(
                            '${AppRoutes.advertPath}/${AppRoutes.editAdddvertPath}?advertId=${advert.advertId}');
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
                  ),
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
      const DataColumn2(
        label: Text('Mô tả'),
      ),
      DataColumn2(
        label: const Expanded(child: Text('Loại')),
        fixedWidth: Utils.getWidth(context) * 0.05,
      ),
      const DataColumn2(
        label: Text('Open Url'),
        // fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('Ngày bắt đầu '),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('Ngày kết thúc '),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Expanded(child: Text('Người tạo')),
        fixedWidth: Utils.getWidth(context) * 0.1,
      ),
      DataColumn2(
        label: const Text('Tag'),
        fixedWidth: Utils.getWidth(context) * 0.05,
      ),
      // DataColumn2(
      //   label: const Text('Ngày tạo'),
      //   fixedWidth: Utils.getWidth(context) * 0.1,
      // ),
      const DataColumn2(
        label: const Text(''),
        fixedWidth: 40,
      ),
    ];

    return data;
  }
}
