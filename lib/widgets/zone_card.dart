import 'package:flutter/material.dart';

//Widget to be used when adding any new "Zones" of crypto on the HomePage.
class ZoneCard extends StatelessWidget {
  final String title;
  final String coinName;
  final String percentageChange;
  final int numberOfCoins;
  const ZoneCard({
    super.key, required this.title, required this.coinName, required this.percentageChange, required this.numberOfCoins,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 80,
      width: (MediaQuery.of(context).size.width - 42) / 2,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Text(
                "$numberOfCoins coins",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontStyle: FontStyle.italic),
              )),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage(getImageFromName(coinName)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  coinName,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$percentageChange  ",
                style: const TextStyle(color: Colors.green),
              )),
        ],
      ),
    );
  }
}

String getImageFromName(String coinName){
  switch (coinName){
    case "Fetch.ai" :
      return "https://altcoinsbox.com/wp-content/uploads/2023/03/fetch.ai-logo.png";
    case "TRON" :
      return "https://cryptologos.cc/logos/tron-trx-logo.png";
    case "1inch" :
      return "https://cryptologos.cc/logos/1inch-1inch-logo.png";
    default :
      return "https://cryptologos.cc/logos/tron-trx-logo.png";
  }
}
