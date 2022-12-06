import 'package:crypto_demo/core/network/http.dart';
import 'package:crypto_demo/home/model/coin.dart';

abstract class CoinRepository {
  Future<List<Coin>> fetchCoins();
}

class CoinRepositoryImpl implements CoinRepository {
  CoinRepositoryImpl({required this.httpService});
  final HttpService httpService;

  @override
  Future<List<Coin>> fetchCoins() async {
    final response = await httpService.get(path: 'api/v3/coins/categories');

    return response.fold(
      (l) => [],
      (r) => r.map((e) => Coin.fromJson(e)).toList(),
    );
  }
}
