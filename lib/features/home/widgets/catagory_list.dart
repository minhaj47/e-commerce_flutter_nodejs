import 'package:ecommerce_app_flutter_nodejs/Constant/global_veriable.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVariables.categoryImages.length,
          itemExtent: 70,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            );
          }),
    );
  }
}
