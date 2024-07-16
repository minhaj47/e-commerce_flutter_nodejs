import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_flutter_nodejs/Constant/global_veriable.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((item) {
        return Builder(
          builder: (BuildContext context) => Image.network(
            item,
            fit: BoxFit.cover,
            height: 160,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 160,
      ),
    );
  }
}
