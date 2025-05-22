part of 'card_bloc.dart';

enum CardStatus { initial, success, failure }

class CardState extends Equatable {
  final CardStatus status;
  final CardResponse? response;

  const CardState({this.status = CardStatus.initial, this.response});

  CardState copyWith({CardStatus? status, CardResponse? response}) {
    return CardState(
      status: status ?? this.status,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [status, response];
}

final class CardProductState extends Equatable {
  final CardStatus status;
  final CardProductResponse response;

  const CardProductState({
    this.status = CardStatus.initial,
    this.response = const CardProductResponse(success: 0, cardProducts: []),
  });

  CardProductState copyWith({
    CardProductResponse? response,
    CardStatus? status,
  }) {
    return CardProductState(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''CardProductState { response: ${response.cardProducts.length}, status: $status }''';
  }

  @override
  List<Object> get props => [response, status];
}
