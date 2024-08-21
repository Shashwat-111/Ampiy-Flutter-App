import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//The Default Text button to be used throughout the app.
class DefaultButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const DefaultButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: CupertinoColors.activeBlue, // Background color
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
          shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(8)), // Rectangular shape
          ),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)));
  }
}
