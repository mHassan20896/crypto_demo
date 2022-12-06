import 'package:crypto_demo/core/network/api_state.dart';
import 'package:crypto_demo/home/bloc/coin_bloc.dart';
import 'package:crypto_demo/home/qr_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'coin_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coins"),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code),
            onPressed: () async {
              final address = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRPage(),
                ),
              );
              await Fluttertoast.showToast(
                msg: address,
              );
            },
          )
        ],
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state.coinsApiState.apiResponseState ==
              ApiResponseState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.coinsApiState.apiResponseState == ApiResponseState.error) {
            return const Center(child: Text('Error'));
          }

          if (state.coinsApiState.apiResponseState ==
              ApiResponseState.success) {
            final response = state.coinsApiState.response!;
            return ListView.builder(
              itemCount: state.coinsApiState.response!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CoinDetailPage(
                          coin: response[index],
                        ),
                      ),
                    );
                  }),
                  title: Text(response[index].name),
                  subtitle: Text("Market cap: ${response[index].marketCap}"),
                );
              },
            );
          }

          context.read<CoinBloc>().add(FetchCoinEvent());

          return Container();
        },
      ),
    );
  }
}
