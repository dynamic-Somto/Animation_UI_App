import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/assets.dart';
import 'package:pay4me/data/constants/route_constants.dart';
import 'package:pay4me/data/services/navigation/index.dart';
import 'package:pay4me/dependency_injection/get_it.dart';
import 'package:pay4me/presentation/components/short_bottom_sheet_bar.dart';
import '../../../../data/constants/sizes_constants.dart';
import '../../../components/all_foods_grid.dart';

class AllFoodsBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  bool isFoodsPage;
  AnimationController pageTransitionController;
  AllFoodsBottomSheet({Key? key, required this.scrollController,
    required this.pageTransitionController,
  required this.isFoodsPage}) : super(key: key);

  @override
  State<AllFoodsBottomSheet> createState() => _AllFoodsBottomSheetState();
}

class _AllFoodsBottomSheetState extends State<AllFoodsBottomSheet> {
  List<String> images = [
    Assets.foods1,
    Assets.foods2,
    Assets.foods3,
    Assets.foods4,
    Assets.foods5,
    Assets.foods6,
    Assets.foods7,
    Assets.foods8,
    Assets.foods9,
    Assets.foods10,
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.isFoodsPage=false;
        });
        if(!widget.pageTransitionController.isAnimating){
          widget.pageTransitionController.forward();
        }
        getItInstance<NavigationServiceImpl>().navigateTo(Routes.searchBottomSheet, isBottomSheet: true, arguments: widget.isFoodsPage);
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'All Foods',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.dimen_22,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                controller: widget.scrollController,
                crossAxisCount: 2,
                crossAxisSpacing: 17,
                mainAxisSpacing: 20,
                children: List.generate(images.length, (index) =>
                    AllFoodsGrid(image: images[index], price: 500, chows: 'Chows', food: 'Amala')),)
            )
          ],
        ),
      ),
    );
  }
}
