import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/category/cubit.dart';
import 'package:repo/src/features/category/state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/utils/utils.dart';
import 'package:repo/src/utils/validate.dart';
import 'package:template/template.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _cubit = Injector.instance<CategoryCubit>();
  final _formKey = GlobalKey<FormState>();
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
        appBarActions: [_renderActions()],
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(child: _renderCategory()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _renderActions() {
    return PrimaryButton(
      labelText: '',
      onPressed: () {
        Utils.showBaseDialog(
          width: 400,
          context: context,
          dialogType: DialogType.confirm,
          customContent: Form(
            key: _formKey,
            child: Column(
              children: [
                const Gap(12),
                AppTextField(
                  controller: _cubit.nameCtrl,
                  isRequired: true,
                  title: 'Tên',
                  validator: (v) {
                    return Validator().notEmpty(v, 'tên');
                  },
                ),
                const Gap(6),
                AppTextField(
                  controller: _cubit.routerCtrl,
                  isRequired: true,
                  title: 'route',
                  validator: (v) {
                    return Validator().notEmpty(v, 'route');
                  },
                ),
                const Gap(6),
                AppTextField(
                  controller: _cubit.imageDesCtrl,
                  isRequired: true,
                  title: 'Ảnh mô tả',
                  validator: (v) {
                    return Validator().notEmpty(v, 'Ảnh mô tả');
                  },
                ),
              ],
            ),
          ),
          title: 'Tạo category',
          onRightButtonClick: () {
            if (_formKey.currentState!.validate()) {
              _cubit.createCate(context);
            }
          },
          content: '',
        );
      },
      padding: const EdgeInsets.all(0),
      borderRadius: 8,
      titleWidget: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }

  Widget _renderCategory() {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          previous.categories != current.categories,
      builder: (context, state) {
        return DataTableCustom(
          scrollController: _cubit.scrollController,
          height: 100,
          onLoadMore: () {
            _cubit.getAllCategories(isLoadMore: true);
          },
          columns: genDataColumnFromLicense(),
          rows: List.generate(
            state.categories.length,
            (index) {
              var cate = state.categories[index];
              return DataRow(
                onSelectChanged: (value) {},
                cells: [
                  DataCell(
                    Text(cate.catId.toString()),
                  ),
                  DataCell(
                    Text(cate.name ?? ''),
                  ),
                  DataCell(
                    Text(cate.route.toString()),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Image(
                        image: NetworkImage(cate.imgDesc ?? ''),
                      ),
                    ),
                  ),
                  DataCell(
                    MenuAnchorCustom(
                      onTapDelete: () {
                        Utils.showBaseDialog(
                          width: 500,
                          context: this.context,
                          dialogType: DialogType.confirm,
                          title: 'Xoá',
                          content: 'Xoá category',
                          onRightButtonClick: () async {
                            _cubit.deleteCate(cate);
                            context.pop();
                          },
                        );
                      },
                      onTapEdit: () {
                        // context.go(
                        //     '${AppRoutes.advertPath}/${AppRoutes.editAdddvertPath}?advertId=${advert.advertId}');
                      },
                      items: [],
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
      ),
      const DataColumn2(
        label: Text('Route'),
      ),
      const DataColumn2(
        label: Text('Ảnh mô tả'),
      ),
      const DataColumn2(
        label: Text(''),
        fixedWidth: 40,
      ),
    ];

    return data;
  }
}
