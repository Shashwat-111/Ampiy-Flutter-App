import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';


void main(){
CoinbaseProvider coinbaseProvider = CoinbaseProvider();
coinbaseProvider.openBitcoin();
coinbaseProvider.getData();

}

class CoinbaseProvider {
  late final WebSocketChannel shashwatWebsocket;

  CoinbaseProvider() {
    shashwatWebsocket = WebSocketChannel.connect(
      Uri.parse('ws://prereg.ex.api.ampiy.com/prices'),
    );
  }

  void openBitcoin() {
    shashwatWebsocket.sink.add(
      jsonEncode({
              "method": "SUBSCRIBE",
              "params": ["all@ticker"],
              "cid": 1
            })
    );
  }

  void closeBitcoin() {
    shashwatWebsocket.sink.close();
  }

  void getData() {
    print("starting to get data");

    /// Listen for all incoming data
    shashwatWebsocket.stream.listen(
          (data) {
        final jsonResponse = jsonDecode(data);

        if (jsonResponse["stream"] == "all@fpTckr") {
          List<dynamic> dataList = jsonResponse["data"];

          for (var item in dataList) {
            print(item);
          }
          print("\n--------------------------one for loop completed-----------------------------------------------");
        }
      },
      onError: (error) => print("Error: $error"),
    );
  }


}
