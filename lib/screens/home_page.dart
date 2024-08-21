import 'package:flutter/material.dart';
import '../widgets/card_button.dart';
import '../widgets/top_movers_row.dart';
import '../widgets/welcome_banner.dart';
import '../widgets/zone_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.notifications),
          SizedBox(width: 10)
        ],
        title: const Text("Home", style: TextStyle(fontWeight: FontWeight.w700),),
      ),

      //main body
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //Welcome banner, only display till user is unverified
              WelcomeCard(),
              SizedBox(height: 15),

              //main options of buy,sell,SIP, etc.
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CardButton(icon: Icons.add, label: "BUY"),
                  CardButton(icon: Icons.remove, label: "SELL"),
                  CardButton(icon: Icons.add_card_outlined, label: "DEPOSIT"),
                  CardButton(icon: Icons.calendar_month, label: "START SIP"),
                  CardButton(icon: Icons.calculate_outlined, label: "SIP CALC."),
                  CardButton(icon: Icons.video_collection_outlined, label: "TUTORIAL"),
                ],
              ),

              SizedBox(height: 15),
              Text(
                "TOP MOVERS",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),

              //horizontal scrollable view for top movers crypto
              TopMoversRow(),

              SizedBox(height: 15),
              Text("ZONES",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 15),

              //Clickable Collection of Zones of crypto coins
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ZoneCard(title: "PLATFORM", coinName: "TRON", percentageChange: "9.94%", numberOfCoins: 18),
                  ZoneCard(title: "NFT", coinName: "Fetch.ai", percentageChange: "7.89%", numberOfCoins: 9),
                  ZoneCard(title: "DeFi", coinName: "1inch", percentageChange: "6.87%", numberOfCoins: 9),
                  ZoneCard(title: "PoS", coinName: "TRON", percentageChange: "9.94%", numberOfCoins: 8),
                ],
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}