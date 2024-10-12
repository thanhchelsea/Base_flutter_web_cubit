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
import 'package:sidebarx/sidebarx.dart';
import 'package:template/template.dart';

// const primaryColor = Color(0xFF685BFF);

const white = Colors.white;

class ExampleSidebarX extends StatefulWidget {
  ExampleSidebarX({
    super.key,
    required this.controller,
  });
  final SidebarXController controller;

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
          previous.sidebarMenu != current.sidebarMenu ||
          previous.sidebarItemSelected != current.sidebarItemSelected,
      builder: (context, state) {
        return SidebarX(
          controller: widget.controller,
          theme: SidebarXTheme(
            // margin: const EdgeInsets.all(10),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: themeColorExt?.ksBackground2,
              borderRadius: BorderRadius.circular(20),
            ),
            hoverColor: themeColorExt?.ksPrimary.withOpacity(0.3),
            textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedTextStyle: const TextStyle(color: Colors.white),
            hoverTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            itemTextPadding: const EdgeInsets.only(left: 30),
            selectedItemTextPadding: const EdgeInsets.only(left: 30),
            itemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            selectedItemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: (state.sidebarItemSelected?.subMenu?.isNotEmpty ?? false)
                  ? null
                  : Border.all(
                      color: Colors.transparent,
                    ),
              gradient: (state.sidebarItemSelected?.subMenu?.isEmpty ?? true)
                  ? const LinearGradient(
                      colors: [
                        Color(0xff7CA1FF),
                        Color(0xff5566FF),
                      ],
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 32,
                )
              ],
            ),
            iconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
          extendedTheme: SidebarXTheme(
            width: 220,
            decoration: BoxDecoration(
              color: Color(0xff24244e)
                  .withOpacity(1), // themeColorExt?.ksBackground2,
            ),
          ),
          footerDivider: divider,
          footerBuilder: (context, extended) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await _appCubit.onDataCleared();
                    context.replace(AppRoutes.signInPath);
                  },
                  icon: const Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 18,
                      ),
                      Gap(12),
                      Text(
                        'Đăng xuất',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          showToggleButton: false,
          headerBuilder: (context, extended) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: _renderUser(),
            );
          },
          items: List.generate(
            state.sidebarMenu.length,
            (index) {
              return SidebarXItem(
                icon: state.sidebarMenu[index].icon,
                label: state.sidebarMenu[index].label,
                onTap: () {},
                iconBuilder: state.sidebarMenu[index].subMenu != null
                    ? (selected, hovered) {
                        return Container(
                          width: 220 - 26,
                          padding: EdgeInsets.zero,
                          child: ListTileTheme(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            minVerticalPadding: 0,
                            horizontalTitleGap: 0.0,
                            minLeadingWidth: 0,
                            iconColor: Colors.white,
                            child: ExpansionTile(
                              trailing: Icon(
                                !selected
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 16,
                              ),
                              shape: const Border(),
                              iconColor: Colors.white,
                              controller: state.sidebarMenu[index].expandCtrl,
                              // enabled: false,
                              childrenPadding: const EdgeInsets.all(0),
                              tilePadding: const EdgeInsets.all(0),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    state.sidebarMenu[index].icon,
                                    size: 16,
                                    color: selected
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.7),
                                  ),
                                  const Gap(22),
                                  Expanded(
                                    child: Text(
                                      state.sidebarMenu[index].label ?? '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: selected
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              children: List.generate(
                                state.sidebarMenu[index].subMenu!.length,
                                (i) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: state.sidebarItemSelected ==
                                                state.sidebarMenu[index]
                                                    .subMenu?[i]
                                            ? themeColorExt?.ksInfo
                                            : null,
                                        boxShadow: (state.sidebarItemSelected ==
                                                    state.sidebarMenu[index]
                                                        .subMenu?[i] ??
                                                false)
                                            ? [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.12),
                                                  blurRadius: 12,
                                                )
                                              ]
                                            : null,
                                      ),
                                      width: double.infinity,
                                      child: Text(
                                        state.sidebarMenu[index].subMenu?[i]
                                                .label ??
                                            '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              onExpansionChanged: (bool expanded) {
                                if (expanded) {}
                              },
                            ),
                          ),
                        );
                      }
                    : null,
              );
            },
          ),
        );
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
                  radius: 18,
                  foregroundImage: AssetImage(Assets.images.defaultAvatar.path),
                ),
              const Gap(10),
              SizedBox(
                child: Text(
                  '${_appCubit.state.userProfileEntity?.firstName}${_appCubit.state.userProfileEntity?.lastName}',
                  maxLines: 1,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
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
