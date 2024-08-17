import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  //
  // final channel = WebSocketChannel.connect(
  //     Uri.parse('ws://prereg.ex.api.ampiy.com/prices')
  // );
  //
  // @override
  // void initState() {
  //   super.initState();
  //   channel.sink.add(jsonEncode({
  //     "method": "SUBSCRIBE",
  //     "params": ["all@ticker"],
  //     "cid": 1
  //   }));
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    // channel.stream.listen((data) {
    //   final decodedData = jsonDecode(data);
    //   if (decodedData['stream'] == 'all@fpTckr') {
    //     final List<dynamic> coins = decodedData['data'];
    //     setState(() {
    //       for (var coin in coins) {
    //         print("hi");
    //         print(coin);
    //       }
    //     });
    //   }
    // });
    return const Center(child : Text("Coins Page"));
  }
}