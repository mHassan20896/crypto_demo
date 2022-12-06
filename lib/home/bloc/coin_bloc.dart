import 'package:crypto_demo/core/network/api_state.dart';
import 'package:crypto_demo/home/model/coin.dart';
import 'package:crypto_demo/home/repository/coin_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(this.coinRepository) : super(const CoinState()) {
    on<FetchCoinEvent>(fetchCoins);
  }

  final CoinRepository coinRepository;

  void fetchCoins(FetchCoinEvent event, Emitter<CoinState> emit) async {
    emit(
      state.copyWith(
        coinsApiState: state.coinsApiState.copyWith(
          apiResponseState: ApiResponseState.loading,
        ),
      ),
    );

    final response = await coinRepository.fetchCoins();
    emit(
      state.copyWith(
        coinsApiState: state.coinsApiState.copyWith(
          apiResponseState: ApiResponseState.success,
          response: response,
        ),
      ),
    );
  }
}
