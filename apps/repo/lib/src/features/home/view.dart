import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:repo/src/core/base/base_view.dart';
import 'package:repo/src/features/home/cubit/cubit.dart';
import 'package:repo/src/injector/injector.dart';
import 'package:repo/src/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeView extends StatefulWidget {
  HomeView({
    super.key,
  });
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeCubit _cubit = Injector.instance();
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (timeStamp) {
    //     _cubit.getUserProfile().then(
    //           (value) {},
    //         );
    //   },
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home'),
    );
  }
}
