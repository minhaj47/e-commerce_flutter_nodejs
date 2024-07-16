import 'package:flutter/material.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineSmall,
          children: const <TextSpan>[
            TextSpan(text: 'Hello, '),
            TextSpan(
              text: 'Abul',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
