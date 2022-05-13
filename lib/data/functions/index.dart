double getAnimationPosition({required double initialScaleMin, required double initialScaleMax,
required double animationPositionMin, required double animationPositionMax,
required double initialScalePosition}){
  double animationPosition = (((initialScalePosition-initialScaleMin)*(animationPositionMax-animationPositionMin))/(initialScaleMax-initialScaleMin))-animationPositionMin;
  return animationPosition;
}