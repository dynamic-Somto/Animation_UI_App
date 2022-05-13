import 'package:flutter/material.dart';

abstract class NavigationService {
  Future<dynamic> navigateTo(String routeName, {required bool isBottomSheet, dynamic arguments});
  Future<dynamic> replaceWith(String routeName, {required bool isBottomSheet, dynamic arguments});
  void pop({required bool isBottomSheet, });
  Future<dynamic> replaceUntil(
      {required bool isBottomSheet,
        required String routeName,
        required String lastRouteName,
        dynamic arguments});
}

class NavigationServiceImpl extends NavigationService {
  final GlobalKey<NavigatorState> _navigationKey1 = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _navigationKey2 = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey1 => _navigationKey1;

  GlobalKey<NavigatorState> get navigationKey2 => _navigationKey2;
  @override
  void pop({required bool isBottomSheet}) {
    return isBottomSheet? _navigationKey2.currentState!.pop()
    :_navigationKey1.currentState!.pop();
  }

  @override
  Future<dynamic> navigateTo(String routeName, {required bool isBottomSheet, dynamic arguments}) {
    return isBottomSheet? _navigationKey2.currentState!
        .pushNamed(routeName, arguments: arguments)
    :_navigationKey1.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceWith(String routeName, {required bool isBottomSheet, dynamic arguments}) {
    return isBottomSheet? _navigationKey2.currentState!
        .pushReplacementNamed(routeName, arguments: arguments)
        :_navigationKey1.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future replaceUntil(
      {required bool isBottomSheet,
        required String routeName,
        required String lastRouteName,
        dynamic arguments}) {
    return isBottomSheet? _navigationKey2.currentState!.pushNamedAndRemoveUntil(
        lastRouteName, ModalRoute.withName(routeName),
        arguments: arguments)
    :_navigationKey1.currentState!.pushNamedAndRemoveUntil(
        lastRouteName, ModalRoute.withName(routeName),
        arguments: arguments);
  }
}
