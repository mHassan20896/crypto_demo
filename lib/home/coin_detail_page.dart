import 'package:crypto_demo/home/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinDetailPage extends StatelessWidget {
  const CoinDetailPage({super.key, required this.coin});

  final Coin coin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _row('Name', coin.name),
          _row('Market cap', coin.marketCap.toString()),
          _row('Market cap 24h change', coin.marketCapChange24H.toString()),
          _row('Updated at',
              DateFormat('yyyy MMMM dd, hh:mm').format(coin.updatedAt)),
          _row('Volume', coin.volume24H.toString()),
          _row('Details', coin.content ?? "N/A"),
          const Divider(),
          Text(
            'Top coins',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: coin.top3Coins.map((e) => Image.network(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _row(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
