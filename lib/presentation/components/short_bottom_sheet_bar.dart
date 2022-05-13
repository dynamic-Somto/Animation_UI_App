import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/sizes_constants.dart';

class ShortBottomSheetBar extends AnimatedWidget {
  AnimationController pageTransitionController;
  ShortBottomSheetBar({Key? key, required this.pageTransitionController}) : super(key: key, listenable: pageTransitionController);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(5.5, 0)).animate(CurvedAnimation(
          parent: pageTransitionController,
          curve: Curves.easeOut,
        reverseCurve: Curves.easeIn
      )),
      child: FadeTransition(
        opacity: Tween<double>(begin: 1, end:0).animate(CurvedAnimation(
            parent: pageTransitionController,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn
        )),
        child: Container(
          height: Sizes.dimen_8,
          width: Sizes.dimen_40,
          margin: const EdgeInsets.only(top: Sizes.dimen_20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: AppColors.grey1),
        ),
      ),
    );
  }
}
