import 'package:ecommerce_app_flutter_nodejs/features/profile/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              AccountButton(onTap: () {}, text: 'Your Orders'),
              AccountButton(onTap: () {}, text: 'Turn Sellers'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              AccountButton(onTap: () {}, text: 'Log Out'),
              AccountButton(onTap: () {}, text: 'Your Wishlist'),
            ],
          ),
        )
      ],
    );
  }
}
