import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/assets.dart';
import 'package:pay4me/presentation/ui/base/menu_container/index.dart';
import '../../../data/constants/sizes_constants.dart';
import 'draggable_bottom_sheet/index.dart';
class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late AnimationController _pageTransitionController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _pageTransitionController=AnimationController(vsync: this,
        duration: const Duration(milliseconds: 1000), reverseDuration: const Duration(milliseconds: 1000));
    _animationController.value=0.5;
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    _pageTransitionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        setState(() {
          _animationController.value=notification.extent;
        });
        return true;
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(Assets.baseBackground)
                )
              ),
            ),
            Positioned(
              top: Sizes.dimen_40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenuContainer(animationController: _animationController,),
                  const Padding(
                    padding: EdgeInsets.only(top: 30, left: 25),
                    child: Text(
                      'Find Your \n Chow Now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.dimen_40,
                        height: 1.3
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableBottomSheet(animationController: _animationController, pageTransitionController: _pageTransitionController,)
          ],
        ),
      ),
    );
  }
}
