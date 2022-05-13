import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/colors.dart';
import '../../data/constants/sizes_constants.dart';
class AllFoodsGrid extends StatelessWidget {
  final String image;
  final String food;
  final int price;
  final String chows;
  const AllFoodsGrid({Key? key, required this.image,
    required this.price, required this.chows,
  required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.dimen_200,
      padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_16, horizontal: Sizes.dimen_20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: AppColors.grey2),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: Sizes.dimen_90,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image,)
              )
            ),
          ),
          Text(
            food,
            style: const TextStyle(
              fontSize: Sizes.dimen_14,
            ),
          ),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'N'+price.toString()+'  ',
                    style: const TextStyle(
                      fontSize: Sizes.dimen_11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.red
                    )
                ),
                TextSpan(
                    text: chows,
                    style: const TextStyle(
                      color: AppColors.grey3,
                      fontSize: Sizes.dimen_11,
                      fontWeight: FontWeight.w500,
                    )
                ),
              ]
              )
          )
        ],
      ),
    );
  }
}
