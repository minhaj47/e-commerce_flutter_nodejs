import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String imageLink;
  const SingleProduct({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.only(right: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Image.network(
          imageLink,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
