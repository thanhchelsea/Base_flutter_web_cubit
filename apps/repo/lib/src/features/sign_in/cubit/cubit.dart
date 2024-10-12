import 'package:common_features/auth/data/model/login_request/login_request_model.dart';
import 'package:common_features/auth/domain/entity/login_response/login_response.dart';
import 'package:common_features/auth/domain/usecase/auth_usecase.dart';
import 'package:common_features/common_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_cubit.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';

import 'state.dart';

class SignInCubit extends BaseCubit<SigninState> {
  SignInCubit({required AuthUsecase authUsecase}) : super(SigninState()) {
    this._authUsecase = authUsecase;
  }
  TextEditingController usernameFiled = TextEditingController(text: "");
  TextEditingController passwordField = TextEditingController(text: "");

  final AppCubit _appCubit = Injector.instance();
  late final AuthUsecase _authUsecase;

  Future<void> login(BuildContext context) async {
    var handleLogin = _authUsecase.login(
      LoginRequestModel(
        username: usernameFiled.text,
        password: passwordField.text,
      ),
    );
    await callDataService<LoginResponseEntity?>(
      handleLogin,
      onSuccess: (response) {
        if (response != null) {
          emit(state.copyWith(loginResponse: response));
          _appCubit.setAccesstoken(response);
          clearData();
          context.go(AppRoutes.homePath);
        } else {
          showErrorMessage('Tài khoản hoặc mật khẩu không đúng!');
        }
      },
    );
  }

  clearData() {
    usernameFiled.clear();
    passwordField.clear();
  }
}
