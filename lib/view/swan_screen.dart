import 'package:allison/resources/app_urls/image_urls.dart';
import 'package:allison/resources/components/our_brands_wid.dart';
import 'package:flutter/material.dart';

class SwanScreen extends StatelessWidget {
  const SwanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Image.asset(ImageUrls.appLogo),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(ImageUrls.searchIcon),
                      const SizedBox(width: 10),
                      Image.asset(ImageUrls.favIcon),
                      const SizedBox(width: 10),
                      Image.asset(ImageUrls.shopIcon),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height / 3.5,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        ImageUrls.mainBanner,
                      )),
                    ),
                    child: Center(
                      child: Text(
                        'LIU•JO',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Our Brands',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const Text('view all'),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      OurBrandWid(
                          imagePath: ImageUrls.ourBrand1, title: 'MAX&Co'),
                      OurBrandWid(
                          imagePath: ImageUrls.ourBrand3, title: 'PENNIBLACK'),
                      OurBrandWid(
                          imagePath: ImageUrls.ourBrand2, title: 'LIU•JO')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
