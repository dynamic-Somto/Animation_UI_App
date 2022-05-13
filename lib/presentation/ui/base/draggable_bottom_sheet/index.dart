import 'package:flutter/material.dart';
import 'package:pay4me/presentation/components/black_search_card.dart';
import '../../../../data/constants/route_constants.dart';
import '../../../../data/constants/sizes_constants.dart';
import '../../../../data/services/navigation/index.dart';
import '../../../../dependency_injection/get_it.dart';
import '../../../components/short_bottom_sheet_bar.dart';
import '../../../router.dart';

class DraggableBottomSheet extends AnimatedWidget {
  AnimationController animationController;
  AnimationController pageTransitionController;
  DraggableBottomSheet({Key? key, required this.animationController,
    required this.pageTransitionController}) : super(key: key, listenable: pageTransitionController);

  bool isFoodsPage = true;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
                initialChildSize: isFoodsPage? 0.5:0.95,
                minChildSize:  isFoodsPage? 0.5:0.95,
                maxChildSize: 0.95,
                builder: (BuildContext context,
                    ScrollController scrollController) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: Sizes.dimen_30),
                        height: MediaQuery.of(context).size.height*0.95,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
                        ),
                        child: Navigator(
                          key: getItInstance<NavigationServiceImpl>().navigationKey2,
                          initialRoute: Routes.allFoodsBottomSheet,
                          onGenerateRoute: (settings) => BottomSheetRouter.generateRoutes(settings, scrollController: scrollController,
                              isFoodsPage: isFoodsPage, pageTransitionController: pageTransitionController),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                          child: ShortBottomSheetBar(pageTransitionController: pageTransitionController)),
                      Positioned(
                        bottom: -200,
                        child: SlideTransition(
                          position: Tween<Offset>(begin: Offset.zero, end: const Offset(1.3,-7)).animate(CurvedAnimation(
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
                          child: GestureDetector(
                              onTap: (){
                                if(!pageTransitionController.isAnimating) {
                                  pageTransitionController.forward();
                                }
                                getItInstance<NavigationServiceImpl>()
                                    .navigateTo(Routes.searchBottomSheet,
                                    isBottomSheet: true,
                                    arguments: isFoodsPage);
                              },
                              child: BlackSearchCard(animationController: animationController, isAnimating: pageTransitionController.isAnimating,))),
                        )
                      )
                    ],
                  );
                },
              );
  }
}