import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/generated/assets.gen.dart';
import 'package:repo/src/constants/app_configs.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/router/app_routes.dart';
import 'package:repo/src/values/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppCubit _appCubit = Injector.instance();
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
      () async {
        await _appCubit.onLoaded(context);
        if (!_appCubit.isAuth) {
          context.go(AppRoutes.signInPath);
        } else {
          context.go(AppRoutes.homePath);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              Assets.images.logo.image(
                width: 600,
                // height: 300,
                fit: BoxFit.fill,
              ),
              const Text(
                AppConfigs.appName,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
