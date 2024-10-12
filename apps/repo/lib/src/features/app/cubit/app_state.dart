import 'package:common_features/auth/domain/entity/user_profile/user_profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:repo/src/core/base/base_state.dart';
import 'package:repo/src/values/theme.dart';
import 'package:repo/src/widgets/sidebar.dart';
import 'package:services/services.dart';

extension ThemeExt on ThemeSetting {
  String getTitle() {
    switch (this) {
      case ThemeSetting.dark:
        return "Tối";
      case ThemeSetting.light:
        return "Sáng";
      case ThemeSetting.system:
        return "Hệ thống";
    }
  }

  ThemeData getTheme(BuildContext contex) {
    switch (this) {
      case ThemeSetting.dark:
        return AppTheme.themeDark;
      case ThemeSetting.light:
        return AppTheme.themeLight;
      case ThemeSetting.system:
        {
          if (MediaQuery.of(contex).platformBrightness == Brightness.light) {
            //light mode cua he thong
            return AppTheme.themeLight;
          } else {
            return AppTheme.themeDark;
          }
        }
    }
  }
}

class AppState extends BaseState {
  AppState({
    super.pageState,
    super.message,
    super.errorType,
    this.locale = 'vi',
    this.accestoken,
    this.themeData = ThemeSetting.light,
    this.isLoaded = false,
    this.userProfileEntity,
    this.sidebarItemSelected,
    this.sidebarMenu = const [],
  });

  final String locale;
  final ThemeSetting themeData;
  final String? accestoken;
  bool? isLoaded;
  final UserProfileEntity? userProfileEntity;
  SidebarXItemModel? sidebarItemSelected;
  List<SidebarXItemModel> sidebarMenu;

  @override
  AppState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    String? locale,
    ThemeSetting? themeData,
    String? accestoken,
    bool? isLoaded,
    SidebarXItemModel? sidebarItemSelected,
    UserProfileEntity? userProfileEntity,
    List<SidebarXItemModel>? sidebarMenu,
  }) {
    return AppState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      locale: locale ?? this.locale,
      themeData: themeData ?? this.themeData,
      accestoken: accestoken ?? this.accestoken,
      isLoaded: isLoaded ?? this.isLoaded,
      userProfileEntity: userProfileEntity ?? this.userProfileEntity,
      sidebarItemSelected: sidebarItemSelected ?? this.sidebarItemSelected,
      sidebarMenu: sidebarMenu ?? this.sidebarMenu,
    );
  }

  @override
  String toString() {
    return '${super.toString()} \n AppState{locale: $locale, themeData: $themeData accestoken: $accestoken isLoaded : $isLoaded}';
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        locale,
        themeData,
        accestoken,
        isLoaded,
        userProfileEntity,
        sidebarItemSelected,
        sidebarMenu,
      ];
}