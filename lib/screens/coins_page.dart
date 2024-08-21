import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../service/websocket_responce_model.dart';
import '../widgets/coin_tile.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  late WebSocketChannel channel;
  late Stream<WebSocketResponse> dataStream;

  //connecting to the websocket server and sending the subscription message.
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
    dataStream = channel.stream
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
        children: [
          buildSearchBar(context),
          const SizedBox(height: 10,),
          StreamBuilder<WebSocketResponse>(
            stream: dataStream,
            builder: (context, snapshot) {

              //showing a circular progress indicator,
              // till websocket connection is being established
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(child: Center(child: CircularProgressIndicator()));

                //if any error occurs, showing it on screen.
              } else if (snapshot.hasError) {
                return Expanded(child: Center(child: Text('Error: ${snapshot.error}')));

                //if we start receiving data, displaying it on the UI.
              } else if (snapshot.hasData) {
                final response = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: response.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final datum = response.data![index];
                      return CoinTile(datum: datum, index: index,);
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


  SizedBox buildSearchBar(BuildContext context) {
    return SizedBox(
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
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}