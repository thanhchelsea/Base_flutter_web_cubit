import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/app/splash/view.dart';
import 'package:repo/src/features/sign_in/view.dart';
import 'package:repo/src/injector/injector.dart';

import 'app_routes.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  navigatorKey: _parentKey,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.signInPath,
      builder: (context, state) => const SigInView(),
    ),
    // ShellRoute(
    //   navigatorKey: _shellKey,
    //   builder: (context, state, child) {
    //     var home = Injector.instance<HomeCubit>();
    //     // ignore: cascade_invocations
    //     WidgetsBinding.instance.addPostFrameCallback(
    //       (timeStamp) {
    //         home
    //           ..updateCurrentPage(state.topRoute?.name ?? '')
    //           ..getCurrentTab(state.matchedLocation);
    //       },
    //     );

    //     return HomeView(child: child);
    //   },
    //   routes: <RouteBase>[ ],
    // ),
  ],
  redirect: (context, state) async {
    final isLoggingIn = state.matchedLocation == AppRoutes.signInPath;
    final authCubit = Injector.instance<AppCubit>();
    if (authCubit.state.isLoaded == null || authCubit.state.isLoaded == false) {
      await authCubit.onLoaded(context);
    }
    if (Injector.instance<AppCubit>().isAuth == false &&
        !isLoggingIn &&
        state.matchedLocation != AppRoutes.splashScreen) {
      return AppRoutes.signInPath;
    }
    return null;
  },
);
