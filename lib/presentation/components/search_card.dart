import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/sizes_constants.dart';

import '../../data/constants/colors.dart';
class SearchCard extends StatelessWidget {
  final String image;
  final String food;
  final int price;
  final String chows;
  const SearchCard({Key? key, required this.image,
    required this.price, required this.chows,
    required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Sizes.dimen_20,),
      height: Sizes.dimen_90,
      child: Row(
        children: [
          Container(
            width: Sizes.dimen_110,
            height: double.infinity,
            margin: const EdgeInsets.only(right: Sizes.dimen_20,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image,)
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                food,
                style: const TextStyle(
                  fontSize: Sizes.dimen_14,
                ),
              ),
              const SizedBox(height: Sizes.dimen_6,),
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
          Expanded(child: Container(),),
          const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.heavyPurple,),
        ],
      ),
    );
  }
}
