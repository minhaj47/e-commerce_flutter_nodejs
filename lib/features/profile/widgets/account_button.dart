import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AccountButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: brightness == Brightness.light
                ? Colors.black12.withOpacity(0.03)
                : Colors.white10.withOpacity(0.03),
            side: BorderSide(
              color: brightness == Brightness.light
                  ? Colors.black12.withOpacity(0.05)
                  : Colors.white10.withOpacity(0.05),
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: brightness == Brightness.light
                  ? Colors.black
                  : Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
