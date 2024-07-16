import 'package:ecommerce_app_flutter_nodejs/features/profile/widgets/below_app_bar.dart';
import 'package:ecommerce_app_flutter_nodejs/features/profile/widgets/orders.dart';
import 'package:ecommerce_app_flutter_nodejs/features/profile/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/amazon_in.png',
              height: 45,
              width: 120,
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.notifications_outlined),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search_outlined),
                ),
              ],
            )
          ],
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 20),
          Orders(),
        ],
      ),
    );
  }
}
