import 'package:flutter/material.dart';

class OurBrandWid extends StatelessWidget {
  final String imagePath;
  final String title;
  const OurBrandWid({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 5,
      width: size.width / 3,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath)),
      ),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto Slab',
        ),
      )),
    );
  }
}
