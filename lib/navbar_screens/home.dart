import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.tokenvalues);

  final Map<String, String> tokenvalues;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Account Summary',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '\$40,000',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '24H Change:',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      Text(
                        '6.04%',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              height: 120,
              color: Colors.lightBlue,
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 6.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(newCryptoList[index].toUpperCase()),
                      trailing: Text(tokenvalues['newCryptoList[index]']!),
                    );
                  },
                  itemCount: newCryptoList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
