part of 'card_bloc.dart';

abstract class CardProductEvent extends Equatable {
  const CardProductEvent();

  @override
  List<Object> get props => [];
}

class CardProductFetched extends CardProductEvent {}

class CardAddEvent extends CardProductEvent {
  final AddCard addCard;
  final CardProductBloc cardProductBloc;

  const CardAddEvent(this.addCard, this.cardProductBloc);

  @override
  List<Object> get props => [addCard];
}

class CardDeleteEvent extends CardProductEvent {
  final DeleteCard deleteCard;
  final CardProductBloc cardProductBloc;

  const CardDeleteEvent(this.deleteCard, this.cardProductBloc);

  @override
  List<Object> get props => [deleteCard];
}
