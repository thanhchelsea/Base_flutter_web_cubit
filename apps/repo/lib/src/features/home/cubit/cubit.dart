import 'package:common_features/auth/domain/entity/user_profile/user_profile_entity.dart';
import 'package:common_features/auth/domain/usecase/auth_usecase.dart';
import 'package:common_features/common_features.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/injector/injector.dart';

import 'package:sidebarx/sidebarx.dart';

import 'state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(
    this._authUsecase,
  ) : super(HomeState());
  final AuthUsecase _authUsecase;
  final AppCubit _appCubit = Injector.instance();
  final controller = SidebarXController(selectedIndex: 0, extended: true);
  // final ExpansionTileController expansionTileController =
  //     ExpansionTileController();

  Future<void> getUserProfile() async {
    final handleGetUserProfile = _authUsecase.fetchUserProfile(
      accessToken: _appCubit.state.accestoken ?? '',
    );
    await callDataService<UserProfileEntity?>(
      handleGetUserProfile,
      onSuccess: (response) {
        if (response != null) {
          _appCubit.setUserProfile(response);
        }
      },
    );
  }
}
