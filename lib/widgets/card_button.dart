import 'package:flutter/material.dart';

//the buttons used on HomeScreen for main options like Buy, Sell, SIP etc.
class CardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const CardButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey[50],
                child: Icon(
                  icon,
                  size: 30,
                )),
            Text(label)
          ],
        ),
      ),
    );
  }
}
