import 'dart:convert';
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
      appBar: AppBar(
        title: const Text('Coins Page'),
      ),
      body: StreamBuilder<WebSocketResponse>(
        stream: myStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final response = snapshot.data!;
            return ListView.builder(
              itemCount: response.data?.length ?? 0,
              itemBuilder: (context, index) {
                final datum = response.data![index];
                return ListTile(
                  title: Text(datum.s ?? 'Unknown Coin'),
                  subtitle: Text('Current Price: ${datum.c ?? 'Unknown'}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}