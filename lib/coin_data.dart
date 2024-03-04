import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> newCurrencyList = [
  'aud',
  'brl',
  'cad',
  'cny',
  'eur',
  'gbp',
  'hkd',
  'idr',
  'ils',
  'inr',
  'jpy',
  'mxn',
  'nok',
  'nzd',
  'pln',
  'ron',
  'rub',
  'sek',
  'sgd',
  'usd',
  'zar'
];

const List<String> newCryptoList = [
  'bitcoin',
  'ethereum',
  'litecoin',
];

class CoinData {
  CoinData(this.currency);

  String currency;
  String coingeckoAPI = 'CG-BjYrtUsRzTT238nuScEFATYM';

  Future<dynamic> getCoinPrice() async {
    Map<String, String> cryptoprices = {};
    for (String cryptocurrency in newCryptoList) {
      var coingeckoUri = Uri.https(
        'api.coingecko.com',
        '/api/v3/coins/markets',
        {
          'vs_currency': currency,
          'ids': cryptocurrency,
          'x_cg_demo_api_key': coingeckoAPI,
        },
      );
      var response = await http.get(coingeckoUri);
      if (response.statusCode == 200) {
        var decodeCoinData = jsonDecode(response.body);
        var cryptoprice = decodeCoinData[0]['current_price'];
        cryptoprices[cryptocurrency] = cryptoprice.toString();
      } else {
        print(response.statusCode);
        throw 'Problem with the Get request';
      }
    }
    return cryptoprices;
  }
}
