import 'package:flutter/material.dart';
import '../service/websocket_responce_model.dart';
import '../utils/helper_functions.dart';


class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.datum,
    required this.index
  });

  final Datum datum;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //changing the tile color based on odd or even index.
      tileColor: index%2 == 0 ? Colors.white : Colors.grey[200],
      leading: CircleAvatar(
        backgroundImage: NetworkImage(cryptoLogos[datum.s]
            ?? "https://cryptologos.cc/logos/bitcoin-btc-logo.png"),),
      title: Text(datum.s?.substring(0, datum.s!.length -3)
          ?? 'Unknown Coin', style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(getCryptoFullName(datum.s ?? "")),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "₹ ${datum.c}",
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14),),
          const SizedBox(width: 10),
          Container(
            width: 80,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(width: 1, color: Colors.grey)
            ),
            child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    double.parse(datum.p!) >= 0
                        ? const Icon(Icons.arrow_upward, color: Colors.green,size: 20,)
                        : const Icon(Icons.arrow_downward, color: Colors.red,size: 20,) ,
                    const SizedBox(width: 4,),
                    double.parse(datum.p!) >= 0
                        ? Text("${double.parse(datum.p!).toStringAsFixed(2)}%", style: const TextStyle(color:Colors.green, fontSize: 15),)
                        : Text("${double.parse(datum.p!).abs().toStringAsFixed(2)}%", style: const TextStyle(color:Colors.red, fontSize: 15),)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}