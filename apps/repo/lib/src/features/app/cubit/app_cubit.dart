import 'dart:convert';
import 'dart:math';

import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:common_features/auth/domain/entity/login_response/login_response.dart';
import 'package:common_features/auth/domain/entity/user_profile/user_profile_entity.dart';
import 'package:common_features/common_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/app/cubit/app_state.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/widgets/sidebar.dart';
import 'package:services/services.dart';

class AppCubit extends BaseCubit<AppState> {
  AppCubit({
    required AppService appService,
  }) : super(
          AppState(menuTree: TreeNode.root()),
        ) {
    _appService = appService;
    initSideMenu();
  }
  late AppService _appService;
  bool get isAuth => state.accestoken != null && state.accestoken!.isNotEmpty;
  Map<String, Color> transactionTypeColors = {};
  var menu = [
    TreeNode(
      key: '0',
      data: TreeNodeExt(
        name: 'Trang chủ',
        pathRouter: AppRoutes.homePath,
        icon: const Icon(
          Icons.dashboard,
        ),
      ),
    ),
    TreeNode(
      key: '1',
      data: TreeNodeExt(
        name: 'Quảng cáo',
        pathRouter: AppRoutes.advertPath,
        icon: const Icon(
          Icons.show_chart_sharp,
        ),
      ),
    )..addAll(
        [
          TreeNode(
            key: '11',
            data: TreeNodeExt(
              name: 'Danh sách',
              pathRouter: AppRoutes.advertListPath,
              parentPathRouter: AppRoutes.advertPath,
              icon: const Icon(
                Icons.show_chart_sharp,
              ),
            ),
          ),
          TreeNode(
            key: '12',
            data: TreeNodeExt(
              name: 'Thêm',
              pathRouter: AppRoutes.insertAdddvertPath,
              parentPathRouter: AppRoutes.advertPath,
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    TreeNode(
      key: '2',
      data: TreeNodeExt(
        name: 'Vị trí',
        pathRouter: AppRoutes.locationPath,
        icon: const Icon(
          Icons.pin_drop_rounded,
        ),
      ),
    )..addAll(
        [
          TreeNode(
            key: '21',
            data: TreeNodeExt(
              name: 'Danh sách',
              pathRouter: AppRoutes.locationListPath,
              parentPathRouter: AppRoutes.locationPath,
              icon: const Icon(
                Icons.show_chart_sharp,
              ),
            ),
          ),
          TreeNode(
            key: '22',
            data: TreeNodeExt(
              name: 'Thêm',
              pathRouter: AppRoutes.insertLocaitonPath,
              parentPathRouter: AppRoutes.locationPath,
              icon: const Icon(
                Icons.add,
              ),
            ),
          ),
        ],
      ),
    TreeNode(
      key: '3',
      data: TreeNodeExt(
        name: 'Category',
        pathRouter: AppRoutes.categoryPath,
        icon: const Icon(
          Icons.category,
        ),
      ),
    ),
    TreeNode(
      key: '20',
      data: TreeNodeExt(
        name: 'Cài đặt',
        pathRouter: AppRoutes.settingPath,
        icon: const Icon(
          Icons.settings,
        ),
      ),
    ),
    // TreeNode(key: "Collection", data: Icons.collections_bookmark)
    //   ..addAll([
    //     TreeNode(key: "Framework"),
    //     TreeNode(key: "Technology"),
    //   ]),
    // TreeNode(
    //   key: 'Settings',
    //   data: TreeNodeExt(
    //     icon: const Icon(
    //       Icons.settings,
    //     ),
    //   ),
    // ),
  ];

  void initSideMenu() {
    emit(
      state.copyWith(
        menuTree: state.menuTree..addAll(menu),
      ),
    );
  }

  Future<void> onLoaded(BuildContext context) async {
    try {
      final locale = await _appService.locale as String?;
      final theme = await _appService.getTheme() ?? ThemeSetting.light;
      //get access token
      String? accestoken;
      final loginResponseEntity = await _appService.getLoginResponseEntity();
      if (loginResponseEntity != null) {
        accestoken = LoginResponseEntity.fromJson(
          jsonDecode(loginResponseEntity as String) as Map<String, dynamic>,
        ).token;
      }

      emit(
        state.copyWith(
          locale: locale,
          themeData: theme,
          accestoken: accestoken,
          isLoaded: true,
        ),
      );
      logger.i('===== App state === :  $state =====');
    } catch (e, s) {
      logger.e('AppBloc load failed', e, s);
    }
  }

  void getCurrentMenu(String matchedLocation) {
    if (matchedLocation.contains(AppRoutes.homePath)) {
      emit(state.copyWith()..featureSelected = menu.first);
    }

    // if (matchedLocation.contains(AppRoutes.advertPath)) {
    //   emit(state.copyWith()..featureSelected = menu[1]);
    // }
    // if (matchedLocation.contains(AppRoutes.locationPath)) {
    //   emit(state.copyWith()..featureSelected = menu[2]);
    // }
    // if (matchedLocation.contains(AppRoutes.settingPath)) {
    //   emit(state.copyWith()..featureSelected = menu[2]);
    // }

    var subPaths = matchedLocation.split('/');
    if (subPaths.length > 2) {
      menu.forEach(
        (e) {
          if (e.children.isNotEmpty ?? false) {
            e.children.values.forEach(
              (s) {
                var s1 = s as TreeNode<TreeNodeExt>;
                if ('${s1.data!.parentPathRouter}/${s1.data!.pathRouter}' ==
                    matchedLocation) {
                  print(
                      "999 '${s1.data!.parentPathRouter}/${s1.data!.pathRouter}' ${matchedLocation}");

                  state.treeViewController!.expandAllChildren(e);
                  emit(state.copyWith()..featureSelected = s1);
                }
                return;
              },
            );
          }
        },
      );
    }
  }

  void updateCurrentPage(String name) {
    emit(state.copyWith(currentPageNamed: name));
  }

  void setAccesstoken(LoginResponseEntity response) {
    emit(state.copyWith(accestoken: response.token));
    _appService.setLoginResponseEntity(loginResponse: response);
  }

  void setUserProfile(UserProfileEntity user) {
    emit(state.copyWith(userProfileEntity: user));
  }

  void updateSidebarItemSelected(SidebarXItemModel item) {
    emit(state.copyWith(sidebarItemSelected: item));
  }

  Future<void> onDataCleared() async {
    await _appService.removeLoginResponseEntity();
    // await _appService.removeUser();
    emit(
      state.copyWith(
        userProfileEntity: null,
        accestoken: '',
        sidebarItemSelected: null,
      ),
    );
  }

  void initTreeViewContrl(
      TreeViewController<TreeNodeExt, TreeNode<TreeNodeExt>> controller,
      BuildContext context) {
    emit(state.copyWith(treeViewController: controller));
    getCurrentMenu(GoRouterState.of(context).matchedLocation);
    if (state.featureSelected != null) {
      controller.expandAllChildren(state.featureSelected!);
    }
  }

  void onChangeFeature(TreeNode<TreeNodeExt> item, BuildContext context) {
    if (GoRouterState.of(context).uri.path == item.data!.pathRouter ||
        state.featureSelected?.parent == item ||
        item.children.isNotEmpty) return;

    if ((item.data?.pathRouter?.isNotEmpty ?? false) && item.children.isEmpty) {
      if (item.data?.parentPathRouter == null) {
        context.go(item.data?.pathRouter ?? '');
      } else {
        context.go(
            '${item.data?.parentPathRouter ?? ''}/${item.data?.pathRouter ?? ''}');
      }
    }
    emit(state.copyWith()..featureSelected = item);
  }
}
