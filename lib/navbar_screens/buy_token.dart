import 'package:flutter/material.dart';

class BuyToken extends StatelessWidget {
  const BuyToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.black26,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bitcoin',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'BTC',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$44,000',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '+4.3%',
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
