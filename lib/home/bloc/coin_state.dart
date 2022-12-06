part of 'coin_bloc.dart';

class CoinState extends Equatable {
  const CoinState({this.coinsApiState = const ApiState()});

  final ApiState<List<Coin>> coinsApiState;

  @override
  List<Object> get props => [coinsApiState];

  CoinState copyWith({
    ApiState<List<Coin>>? coinsApiState,
  }) =>
      CoinState(coinsApiState: coinsApiState ?? this.coinsApiState);
}
