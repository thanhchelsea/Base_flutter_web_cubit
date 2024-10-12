/// Services package
library services;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:services/constants/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

export 'src/services.dart';
part 'src/storage/local_storage_service/local_storage_secure_service.dart';
part 'src/storage/local_storage_service/local_storage_service.dart';
part 'src/storage/local_storage_service/shared_preferences_service.dart';
part 'src/app_services/app_service.dart';
part 'src/app_services/app_service_impl.dart';
