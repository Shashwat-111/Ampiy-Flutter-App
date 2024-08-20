import 'dart:convert';
import 'package:ampiy_flutter_app/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../service/websocket_responce_model.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  late WebSocketChannel channel;
  late Stream<WebSocketResponse> myStream;
  //late Stream<WebSocketResponse> myStream;

  connectToChannel() async {
    channel = WebSocketChannel.connect(
        Uri.parse('ws://prereg.ex.api.ampiy.com/prices'));
    channel.sink.add(jsonEncode({
      "method": "SUBSCRIBE",
      "params": [
        "all@ticker"
      ],
      "cid": 1
    }));
    myStream = channel.stream
        .map<WebSocketResponse>((value) => WebSocketResponse.fromJson(jsonDecode(value)));
  }

  @override
  void initState() {
    super.initState();
    connectToChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('COINS',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width-32,
            child: const TextField(
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: "search",
                alignLabelWithHint: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder()
              ),
            ),
          ),
          const SizedBox(height: 10,),
          StreamBuilder<WebSocketResponse>(
            stream: myStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final response = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: response.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final datum = response.data![index];
                      //print(datum.s);
                      return ListTile(
                        tileColor: index%2 == 0 ? Colors.white : Colors.grey[200],
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(cryptoLogos[datum.s] ?? "https://cryptologos.cc/logos/bitcoin-btc-logo.png"),),
                        title: Text(datum.s?.substring(0, datum.s!.length -3) ?? 'Unknown Coin', style: const TextStyle(fontWeight: FontWeight.bold),),
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
                              //padding: EdgeInsets.all(5),
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
                        //subtitle: Text('Current Price: ${datum.c ?? 'Unknown'}'),
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}