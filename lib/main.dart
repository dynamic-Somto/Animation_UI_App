import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dependency_injection/get_it.dart';
import 'index.dart';

void main() async {
  init();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));

    runApp(Index());
  });
}