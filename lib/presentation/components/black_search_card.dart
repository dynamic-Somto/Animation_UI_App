import 'package:flutter/material.dart';

import '../../data/constants/sizes_constants.dart';
import '../../data/functions/index.dart';
class BlackSearchCard extends AnimatedWidget {
  AnimationController animationController;
  bool isAnimating;
  BlackSearchCard({Key? key, required this.animationController, required this.isAnimating}) : super(key: key, listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0,
          getAnimationPosition(initialScaleMin: 0.5,
          initialScaleMax: 0.95, animationPositionMin: 20,
          animationPositionMax: -200, initialScalePosition: animationController.value)
      ),
      child: Transform.rotate(angle: 315,
        child: Container(
          height: Sizes.dimen_90,
          width: Sizes.dimen_90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow:isAnimating? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 10),
                  blurRadius: 8,
                  spreadRadius: 1.5
                ),
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(10, 0),
                    blurRadius: 8,
                    spreadRadius: 1.5
                )
              ]: null,
              color: Colors.black
          ),
          child: Container(
            height: Sizes.dimen_56,
            width: Sizes.dimen_56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)
            ),
            child: Transform.rotate(
                angle: -45,
                child: const Icon(Icons.search, size: Sizes.dimen_24, color: Colors.white,)),
          ),
        ),
      ),
    );
  }
}
