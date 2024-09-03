import 'package:allison/resources/constants/colors.dart';
import 'package:flutter/material.dart';

class AnimatedClickableTextContainer extends StatefulWidget {
  final String iconSrc;
  final String title;
  final Color bgColor;
  final VoidCallback press;

  const AnimatedClickableTextContainer({
    super.key,
    required this.iconSrc,
    required this.title,
    required this.press,
    required this.bgColor,
  });

  @override
  State createState() {
    return _AnimatedClickableTextContainerState();
  }
}

class _AnimatedClickableTextContainerState
    extends State<AnimatedClickableTextContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.bgColor,
      ),
      child: InkWell(
        child: ListTile(onTap: widget.press, title: getMenuItem()),
      ),
    );
  }

  Widget getMenuItem() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.iconSrc.isNotEmpty)
            Image.asset(widget.iconSrc,
                height: 24, fit: BoxFit.contain, color: AppColors.red),
          if (widget.iconSrc.isNotEmpty) const SizedBox(width: 15),
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
