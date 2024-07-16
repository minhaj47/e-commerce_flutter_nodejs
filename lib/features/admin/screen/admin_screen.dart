import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

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
            const Text(
              'Admin',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
