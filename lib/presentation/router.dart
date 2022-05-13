
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pay4me/presentation/ui/base/draggable_bottom_sheet/all_foods.dart';
import 'package:pay4me/presentation/ui/base/draggable_bottom_sheet/search.dart';
import 'package:pay4me/presentation/ui/base/index.dart';
import '../data/constants/route_constants.dart';

class CustomRouter {
  CustomRouter._();
  static generateRoutes(settings) {
    switch (settings.name) {
      case Routes.init:
        return PageTransition(
            child: const Base(),
            type: PageTransitionType.fade,
            settings: settings);
    }
  }
}
class BottomSheetRouter {
  BottomSheetRouter._();
  static generateRoutes(settings, {ScrollController? scrollController, bool? isFoodsPage, AnimationController? pageTransitionController}) {
    switch (settings.name) {
      case Routes.allFoodsBottomSheet:
        return PageTransition(
            child: AllFoodsBottomSheet(scrollController: scrollController!,
              isFoodsPage: isFoodsPage!, pageTransitionController: pageTransitionController!,),
            type: PageTransitionType.fade,
            settings: settings);
      case Routes.searchBottomSheet:
        return PageTransition(
          duration: const Duration(milliseconds: 700),
            childCurrent: AllFoodsBottomSheet(scrollController: scrollController!,
              isFoodsPage: isFoodsPage!, pageTransitionController: pageTransitionController!,),
            child: SearchBottomSheet(isFoodsPage: isFoodsPage,pageTransitionController: pageTransitionController,),
            type: PageTransitionType.rightToLeftJoined,
            settings: settings);
    }
  }
}
