import 'package:flutter/material.dart';
import 'default_button.dart';

//widget that is displayed on top of home screen with a welcome text and
//a get verified button. To be shown only with user is unverified.
class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      height: 160,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Welcome to AMPHY!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          const Text(
            "Buy your first Crypto Asset today",
          ),
          DefaultButton(
            text: 'Verify Account',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
