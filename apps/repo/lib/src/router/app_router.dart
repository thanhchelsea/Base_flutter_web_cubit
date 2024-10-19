import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/features/advert/view.dart';
import 'package:repo/src/features/advert_detail/view.dart';
import 'package:repo/src/features/app/cubit/app_cubit.dart';
import 'package:repo/src/features/app/splash/view.dart';
import 'package:repo/src/features/app/view/view.dart';
import 'package:repo/src/features/category/view.dart';
import 'package:repo/src/features/create_advert/view.dart';
import 'package:repo/src/features/create_location/view.dart';
import 'package:repo/src/features/home/cubit/cubit.dart';
import 'package:repo/src/features/home/view.dart';
import 'package:repo/src/features/location/view.dart';
import 'package:repo/src/features/location_detail/view.dart';
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
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        var appCubit = Injector.instance<AppCubit>();
        // ignore: cascade_invocations
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            appCubit.updateCurrentPage(state.topRoute?.name ?? '');
            appCubit.getCurrentMenu(state.matchedLocation);
          },
        );

        return AppView(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRoutes.homeNamed,
          path: AppRoutes.homePath,
          builder: (context, state) {
            return HomeView();
          },
        ),
        GoRoute(
          name: AppRoutes.advertNamed,
          path: AppRoutes.advertPath,
          builder: (context, state) {
            return Container();
          },
          routes: [
            GoRoute(
              name: AppRoutes.advertListNamed,
              path: AppRoutes.advertListPath,
              builder: (context, state) {
                return const AdvertView();
              },
            ),
            GoRoute(
              name: AppRoutes.insertAdvertNamed,
              path: AppRoutes.insertAdddvertPath,
              builder: (context, state) {
                int? advertId = state.uri.queryParameters['advertId'] != null
                    ? int.parse(state.uri.queryParameters['advertId']!)
                    : null;
                return CreateAdvertView(
                  advertId: advertId,
                );
              },
            ),
            GoRoute(
              name: AppRoutes.editAdvertNamed,
              path: AppRoutes.editAdddvertPath,
              builder: (context, state) {
                int? advertId = state.uri.queryParameters['advertId'] != null
                    ? int.parse(state.uri.queryParameters['advertId']!)
                    : null;
                return CreateAdvertView(
                  advertId: advertId,
                );
              },
            ),
            GoRoute(
              name: AppRoutes.advertDetailNamed,
              path: AppRoutes.advertDetailPath,
              builder: (context, state) {
                int? advertId = state.uri.queryParameters['advertId'] != null
                    ? int.parse(state.uri.queryParameters['advertId']!)
                    : null;
                return AdvertDetailView(
                  advertId: advertId ?? -1,
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.locationNamed,
          path: AppRoutes.locationPath,
          builder: (context, state) {
            return Container();
          },
          routes: [
            GoRoute(
              name: AppRoutes.locationListNamed,
              path: AppRoutes.locationListPath,
              builder: (context, state) {
                return LocationView();
              },
            ),
            GoRoute(
              name: AppRoutes.insertLocaitonNamed,
              path: AppRoutes.insertLocaitonPath,
              builder: (context, state) {
                return CreateLocationView();
              },
            ),
            GoRoute(
              name: AppRoutes.locationDetailNamed,
              path: AppRoutes.locationDetailPath,
              builder: (context, state) {
                int? locationId =
                    state.uri.queryParameters['locationId'] != null
                        ? int.parse(state.uri.queryParameters['locationId']!)
                        : null;
                return LocaionDetailDetailView(
                  locationId: locationId ?? -1,
                );
              },
            ),
            GoRoute(
              name: AppRoutes.editLocationNamed,
              path: AppRoutes.editLocationPath,
              builder: (context, state) {
                int? locationId =
                    state.uri.queryParameters['locationId'] != null
                        ? int.parse(state.uri.queryParameters['locationId']!)
                        : null;
                return CreateLocationView(
                  locationId: locationId,
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: AppRoutes.categoryNamed,
          path: AppRoutes.categoryPath,
          builder: (context, state) {
            return CategoryView();
          },
        ),
        GoRoute(
          name: AppRoutes.settingNamed,
          path: AppRoutes.settingPath,
          builder: (context, state) {
            return Text('setting');
          },
        ),
      ],
    ),
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
