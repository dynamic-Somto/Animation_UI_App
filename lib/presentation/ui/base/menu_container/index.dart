import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/colors.dart';

import '../../../../data/constants/sizes_constants.dart';
import '../../../../data/functions/index.dart';
class MenuContainer extends AnimatedWidget {
  // Animation<double> animation;
  AnimationController animationController;
  MenuContainer({Key? key, required this.animationController}) : super(key: key, listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(getAnimationPosition(initialScaleMin: 0.5,
          initialScaleMax: 0.95, animationPositionMin: 0,
          animationPositionMax: -85, initialScalePosition: animationController.value), 0.0),
      child: Opacity(
        opacity: getAnimationPosition(initialScaleMin: 0.95,
            initialScaleMax: 0.5, animationPositionMin: 0,
            animationPositionMax: 1, initialScalePosition: animationController.value),
        child: Container(
          height: Sizes.dimen_60,
          width: Sizes.dimen_60,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 25),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallCircle(hasInnerCircle: true),
                  smallCircle(hasInnerCircle: false),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  smallCircle(hasInnerCircle: false),
                  smallCircle(hasInnerCircle: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget smallCircle({required bool hasInnerCircle}){
  return Container(
    height: Sizes.dimen_15,
    width: Sizes.dimen_15,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.grey3)
    ),
    child: hasInnerCircle? Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.grey3
      ),
    ): const SizedBox(),
  );
}
