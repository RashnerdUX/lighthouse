import 'package:bitcoin_ticker/new_price_screen.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'crypto_card.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int cryptoprice = 0;
  String defaultCurrency = 'usd';
  int ethPrice = 0;
  int ltcPrice = 0;

  Map<String, String> coinvalues = {};
  bool isWaiting = false;

  Future<void> updateUI() async {
    CoinData crypto = CoinData(defaultCurrency);
    isWaiting = true;
    try {
      var data = await crypto.getCoinPrice();
      isWaiting = false;
      setState(() {
        coinvalues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  Widget androidPicker() {
    List<DropdownMenuItem<String>> currencyDD = [];

    for (String currency in newCurrencyList) {
      var newCurrency = DropdownMenuItem(
        child: Text(currency.toUpperCase()),
        value: currency.toUpperCase(),
      );
      currencyDD.add(newCurrency);
    }
    return DropdownButton<String>(
      value: defaultCurrency.toUpperCase(),
      items: currencyDD,
      onChanged: (value) {
        setState(
          () {
            defaultCurrency = value!;
            updateUI();
          },
        );
      },
    );
  }

  Widget iOSPicker() {
    List<Widget> pickerItems = [];
    for (String currency in newCurrencyList) {
      var newCurrency = Text(currency.toUpperCase());
      pickerItems.add(newCurrency);
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {},
      children: pickerItems,
      backgroundColor: Colors.lightBlue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CryptoCard(
                  cryptoprice: isWaiting ? 0 : coinvalues['bitcoin'],
                  defaultCurrency: defaultCurrency,
                  cryptoName: 'BTC',
                ),
                CryptoCard(
                    cryptoprice: isWaiting ? 0 : coinvalues['ethereum'],
                    defaultCurrency: defaultCurrency,
                    cryptoName: 'ETH'),
                CryptoCard(
                    cryptoprice: isWaiting ? 0 : coinvalues['litecoin'],
                    defaultCurrency: defaultCurrency,
                    cryptoName: 'LTC'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CryptoWatch();
              }));
            },
            child: Container(
              color: Colors.lightBlueAccent,
              child: Text(
                'Updated UI',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: androidPicker(),
          ),
        ],
      ),
    );
  }
}
