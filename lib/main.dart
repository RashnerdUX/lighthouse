import 'package:flutter/material.dart';
import 'price_screen.dart';

var priceData = 'No data to display';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PriceScreen(),
    );
  }
}
// void getCryptoPrice() async {
//   CoinData cryptoPrice = CoinData('usd');
//   var data = await cryptoPrice.getCoinPrice();
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) {
//         return PriceScreen(
//           pricedata: data,
//         );
//       },
//     ),
//   );
// }
