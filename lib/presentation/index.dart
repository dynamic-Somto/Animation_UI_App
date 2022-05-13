// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pay4me/presentation/router.dart';

import '../data/constants/route_constants.dart';
import '../data/services/navigation/index.dart';
import '../dependency_injection/get_it.dart';

class Index extends StatefulWidget {
  Index({Key? key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(),
            ),
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Gilroy-Regular",
          ),
          navigatorKey: getItInstance<NavigationServiceImpl>().navigationKey1,
          debugShowCheckedModeBanner: false,
          title: 'Lag Genie',
          initialRoute: Routes.init,
          onGenerateRoute: (settings) => CustomRouter.generateRoutes(settings),
    );
  }
}
