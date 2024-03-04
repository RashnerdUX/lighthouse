import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'navbar_screens/buy_token.dart';
import 'navbar_screens/home.dart';
import 'navbar_screens/profile.dart';
import 'navbar_screens/stake_token.dart';
import 'coin_data.dart';

class CryptoWatch extends StatefulWidget {
  const CryptoWatch({Key? key}) : super(key: key);

  @override
  State<CryptoWatch> createState() => _CryptoWatchState();
}

class _CryptoWatchState extends State<CryptoWatch> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool isWaiting = false;
  Map<String, String> tokenValues = {};

  Future<void> getTokenValues() async {
    CoinData token = CoinData('usd');
    isWaiting = true;
    try {
      var tokenData = await token.getCoinPrice();
      isWaiting = false;
      setState(() {
        tokenData = tokenValues;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getTokenValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(tokenValues),
      BuyToken(),
      StakeScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: [
          CurvedNavigationBarItem(child: Icon(Icons.home), label: 'Home'),
          CurvedNavigationBarItem(child: Icon(Icons.credit_card), label: 'Buy'),
          CurvedNavigationBarItem(child: Icon(Icons.storage), label: 'Stake'),
          CurvedNavigationBarItem(child: Icon(Icons.person), label: 'Profile'),
        ],
        color: Colors.lightBlue,
        backgroundColor: Colors.white,
        animationDuration: Duration(
          milliseconds: 300,
        ),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: screens[_page],
    );
  }
}
