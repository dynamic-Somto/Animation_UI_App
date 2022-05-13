import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/colors.dart';
import 'package:pay4me/presentation/components/search_card.dart';
import 'package:pay4me/presentation/components/tag.dart';

import '../../../../data/constants/assets.dart';
import '../../../../data/constants/sizes_constants.dart';
import '../../../../data/services/navigation/index.dart';
import '../../../../dependency_injection/get_it.dart';
class SearchBottomSheet extends StatefulWidget {
  bool isFoodsPage;
  AnimationController pageTransitionController;
  SearchBottomSheet({Key? key, required this.isFoodsPage, required this.pageTransitionController}) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
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
          widget.isFoodsPage=true;
        });
        if(!widget.pageTransitionController.isAnimating){
          widget.pageTransitionController.reverse();
        }
        getItInstance<NavigationServiceImpl>().pop(isBottomSheet: true);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32,),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(Sizes.dimen_15, Sizes.dimen_10, Sizes.dimen_15, Sizes.dimen_20),
                  prefixIcon: Icon(Icons.search, color: AppColors.grey3,),
                  hintText: 'Search for stuff',
                  suffixIcon: Icon(Icons.cancel, color: AppColors.grey3, size: Sizes.dimen_18,),
                  isCollapsed: true,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(fontSize: Sizes.dimen_14, color: AppColors.grey4),
                ),
              ),
            ),
            const Divider(height: Sizes.dimen_10, color: AppColors.grey3,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_20, horizontal: Sizes.dimen_32),
              child: Wrap(
                spacing: Sizes.dimen_10,
                runSpacing: Sizes.dimen_10,
                children: const [
                  Tag(text: 'Traditional',),
                  Tag(text: 'Salads'),
                  Tag(text: 'International'),
                  Tag(text: 'Salads'),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric( horizontal: Sizes.dimen_32),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.dimen_30,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_32, vertical: Sizes.dimen_25,),
                child: Column(
                  children: List.generate(images.length, (index) => SearchCard(image: images[index], price: 500, chows: 'chows', food: 'Amala')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
