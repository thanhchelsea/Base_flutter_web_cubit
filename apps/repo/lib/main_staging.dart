import 'package:flutter/material.dart';
import 'package:repo/bootstrap.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:repo/src/app/app.dart';
import 'package:repo/src/injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  Injector.init();
  bootstrap(() => const App());
}
