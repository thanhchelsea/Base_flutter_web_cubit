import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:animated_tree_view/tree_view/widgets/expansion_indicator.dart';
import 'package:animated_tree_view/tree_view/widgets/indent.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/generated/assets.gen.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/app/cubit/app_state.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/values/colors.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:template/template.dart';

// const primaryColor = Color(0xFF685BFF);

const white = Colors.white;

class ExampleSidebarX extends StatefulWidget {
  ExampleSidebarX({
    super.key,
  });

  @override
  State<ExampleSidebarX> createState() => _ExampleSidebarXState();
}

class _ExampleSidebarXState extends State<ExampleSidebarX> {
  final AppCubit _appCubit = Injector.instance();
  final divider = Divider(color: white.withOpacity(0.3), height: 1);
  late TextTheme textTheme;
  ThemeColorExtension? themeColorExt;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeColorExt = Theme.of(context).extension<ThemeColorExtension>();
    textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AppCubit, AppState>(
      bloc: _appCubit,
      buildWhen: (previous, current) =>
          previous.menuTree != current.menuTree ||
          previous.featureSelected?.data?.pathRouter !=
              current.featureSelected?.data?.pathRouter,
      builder: (context, state) {
        return sideBar(state);
      },
    );
  }

  Widget _renderUser() {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.centerRight,
          // padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (_appCubit.state.userProfileEntity?.avatar?.isNotEmpty ??
                  false)
                CircleAvatar(
                  radius: 18,
                  foregroundImage: NetworkImage(
                      _appCubit.state.userProfileEntity?.avatar ?? ''),
                )
              else
                CircleAvatar(
                  radius: 24,
                  foregroundImage: AssetImage(Assets.images.defaultAvatar.path),
                ),
              const Gap(10),
              SizedBox(
                child: Text(
                  '${_appCubit.state.userProfileEntity?.firstName}${_appCubit.state.userProfileEntity?.lastName}',
                  maxLines: 1,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    // color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDisabledAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Item disabled for selecting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget sideBar(AppState state) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
            right: BorderSide(color: Color.fromARGB(31, 211, 211, 211))),
        boxShadow: [
          AppBoxShadow.ksSmallShadow(
              color: const Color.fromARGB(31, 144, 144, 144)),
        ],
      ),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(16), child: _renderUser()),
          Expanded(
            child: TreeView.simple<TreeNodeExt>(
              tree: state.menuTree,
              showRootNode: false,
              indentation: const Indentation(width: 0),
              expansionIndicatorBuilder: (context, node) {
                return ChevronIndicator.rightDown(
                  alignment: Alignment.centerLeft,
                  tree: node,
                  color: AppColors.primaryColor,
                  icon: Icons.arrow_right_rounded,
                );
              },
              onTreeReady: (controller) {
                //todo check router
                _appCubit.initTreeViewContrl(
                  controller,
                  context,
                );
              },
              onItemTap: (item) {
                _appCubit.onChangeFeature(item, context);
              },
              builder: (context, node) {
                final isSelected = node.data == state.featureSelected?.data;
                final isExpanded = node.isExpanded;
                return MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    // height: 42,
                    width: 250,
                    // color: node.level >= 2 || isExpanded
                    //     ? Color.fromARGB(255, 248, 250, 255)
                    //     : null,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: node.level >= 2
                          ? const EdgeInsets.only(left: 27)
                          : const EdgeInsets.only(),
                      child: Container(
                        width: 250,
                        height: 45, // The size dimension of the active button
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? node.isLeaf
                                  ? const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 240, 244, 255),
                                        Color.fromARGB(255, 207, 221, 255),
                                      ],
                                    )
                                  : null
                              : null,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              50,
                            ),
                            bottomLeft: Radius.circular(
                              50,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 25,
                          ),
                          child: node.level >= 2
                              ? Text(
                                  node.data?.name ?? '',
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppColors.primaryColor
                                        : null,
                                    fontWeight:
                                        isSelected ? FontWeight.w600 : null,
                                    fontSize: 13,
                                  ),
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      node.data?.icon?.icon,
                                      size: 16,
                                      color: isSelected
                                          ? AppColors.primaryColor
                                          : Colors.black54,
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      node.data?.name ?? '',
                                      style: TextStyle(
                                        color: isSelected
                                            ? AppColors.primaryColor
                                            : null,
                                        fontWeight:
                                            isSelected ? FontWeight.w600 : null,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TreeNodeExt extends Equatable {
  String? pathRouter;
  String? parentPathRouter;
  Icon? icon;
  String name;
  TreeNodeExt({
    required this.name,
    String? key,
    dynamic data,
    this.pathRouter,
    this.icon,
    this.parentPathRouter,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        pathRouter,
        parentPathRouter,
        icon,
        name,
      ];
}

class SidebarXItemModel extends Equatable {
  SidebarXItemModel({
    this.path,
    this.indexFormSideBar,
    this.icon,
    this.label,
    this.onTap,
    this.subMenu,
    required this.id,
    this.parent,
    this.expandCtrl,
  });
  int id;
  IconData? icon;
  String? label;
  Function? onTap;
  String? path;
  int? indexFormSideBar;
  List<SidebarXItemModel>? subMenu;
  SidebarXItemModel? parent;
  ExpansionTileController? expandCtrl;
  @override
  List<Object?> get props => [
        this.icon,
        this.label,
        this.onTap,
        this.path,
        this.indexFormSideBar,
        // this.subMenu,
        // expandCtrl,
      ];
}
