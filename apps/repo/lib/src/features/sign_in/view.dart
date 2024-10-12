import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:repo/generated/assets.gen.dart';
import 'package:repo/src/constants/app_configs.dart';
import 'package:repo/src/core/base/base_view.dart';

import 'package:repo/src/features/sign_in/cubit/cubit.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/utils/validate.dart';
import 'package:template/template.dart';

class SigInView extends StatefulWidget {
  const SigInView({super.key});

  @override
  State<SigInView> createState() => _SigInViewState();
}

class _SigInViewState extends State<SigInView> {
  late final SignInCubit _cubit = Injector.instance();

  ThemeColorExtension? _themeColorExt;
  late TextTheme textTheme;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _themeColorExt = Theme.of(context).extension<ThemeColorExtension>();
    textTheme = Theme.of(context).textTheme;
    return BaseView(
      cubit: _cubit,
      backgroundColor: Colors.white,
      showAppbar: false,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _renderLogo(),
            Column(
              children: [
                _renderAppName(),
                const Gap(40),
                Column(
                  children: [
                    _renderFields(),
                    const Gap(22),
                    _renderButton(),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _renderAppName() {
    // return Container();
    return Align(
      alignment: Alignment.center,
      child: Text(
        AppConfigs.appName,
        style: textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: _themeColorExt?.ksPrimary,
        ),
      ),
    );
  }

  Widget _renderLogo() {
    return Assets.images.logo.image(
      width: 200,
      height: 200,
      // height: 500,
      // fit: BoxFit.fill,
    );
  }

  Widget _renderFields() {
    return Form(
      key: formkey,
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextField(
              controller: _cubit.usernameFiled,
              hintText: 'Nhập tên tài khoản',
              prefixIcon: Assets.icons.icUser.svg(
                width: 12,
              ),
              validator: (p0) {
                return Validator().notEmpty(p0, 'tên tài khoản');
              },
            ),
            const Gap(12),
            AppTextField(
              controller: _cubit.passwordField,
              hintText: 'Nhập mật khẩu',
              prefixIcon: Assets.icons.icLock.svg(
                width: 12,
              ),
              obscureText: true,
              validator: (p0) {
                return Validator().notEmpty(p0, 'tên mật khẩu');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderButton() {
    return PrimaryButton(
      width: 200,
      labelText: "Đăng nhập",
      onPressed: () {
        if (formkey.currentState!.validate()) {
          _cubit.login(context);
        }
      },
    );
  }
}
