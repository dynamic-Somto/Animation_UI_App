import 'package:flutter/material.dart';
import 'package:pay4me/data/constants/colors.dart';
import '../../data/constants/sizes_constants.dart';

class Tag extends StatefulWidget {
  final String text;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? borderRadius;

  const Tag({
    Key? key,
    this.width,
    this.padding,
    this.height,
    this.borderRadius,
    required this.text,
  }) : super(key: key);

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:(widget.text.length*10) + 20,
      height: widget.height,
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text + ' ',
              style: const TextStyle(
                fontSize: Sizes.dimen_13,
                fontWeight: FontWeight.w600
              ),
            ),
            const Icon(Icons.cancel, color: Colors.white, size: Sizes.dimen_16,),
          ],
        ),
      ),
    );
  }
}
