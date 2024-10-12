import 'dart:convert';

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
          AppState(),
        ) {
    _appService = appService;
  }
  late AppService _appService;
  bool get isAuth => state.accestoken != null && state.accestoken!.isNotEmpty;
  Map<String, Color> transactionTypeColors = {};
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
      initSideBarMenu();
    } catch (e, s) {
      logger.e('AppBloc load failed', e, s);
    }
  }

  void setAccesstoken(LoginResponseEntity response) {
    emit(state.copyWith(accestoken: response.token));
    _appService.setLoginResponseEntity(loginResponse: response);
  }

  void setUserProfile(UserProfileEntity user) {
    emit(state.copyWith(userProfileEntity: user));
  }

  void initSideBarMenu() {
    emit(
      state.copyWith(
        sidebarMenu: [
          SidebarXItemModel(
            id: 0,
            path: AppRoutes.homePath,
            indexFormSideBar: 0,
            icon: Icons.home,
            label: 'Trang chủ',
          ),
        ],
      ),
    );
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
}
