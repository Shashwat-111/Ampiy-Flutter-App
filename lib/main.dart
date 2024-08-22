import 'package:ampiy_flutter_app/screens/coins_page.dart';
import 'package:ampiy_flutter_app/screens/home_page.dart';
import 'package:ampiy_flutter_app/screens/profile_page.dart';
import 'package:ampiy_flutter_app/screens/transfer_page.dart';
import 'package:ampiy_flutter_app/screens/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(),
      darkTheme : ThemeData(),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {

    //using persistent Navigation Bar package
    // to get the bottom navigation bar.
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomePage(),
        CoinsPage(),
        TransferPage(),
        WalletPage(),
        ProfilePage(),
      ],
      items: [
        PersistentBottomNavBarItem(icon: const Icon(Icons.home)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.currency_bitcoin_sharp)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.compare_arrows_outlined, color: Colors.white,)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.wallet)),
        PersistentBottomNavBarItem(icon: const Icon(Icons.person))
      ],
      navBarStyle: NavBarStyle.style15,
    );
  }
}



