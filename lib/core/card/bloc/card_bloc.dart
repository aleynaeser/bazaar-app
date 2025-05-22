import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/card_actions/add_card.dart';
import '../models/card_actions/delete_card.dart';
import '../models/card_actions/card_action_response.dart';
import '../models/card_product_response.dart';
import '../repository/card_repository.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardProductBloc extends Bloc<CardProductEvent, CardProductState> {
  final CardRepository _cardRepository;

  CardProductBloc()
    : _cardRepository = CardRepository(),
      super(const CardProductState()) {
    on<CardProductFetched>(_onCardProductFetched);
  }

  Future<void> _onCardProductFetched(
    CardProductFetched event,
    Emitter<CardProductState> emit,
  ) async {
    try {
      final response = await _cardRepository.fetchCardProducts();

      emit(
        state.copyWith(
          status: CardStatus.success,
          response: CardProductResponse(
            success: response.success,
            cardProducts: [...response.cardProducts],
          ),
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CardStatus.failure));
    }
  }
}

class CardAddBloc extends Bloc<CardAddEvent, CardState> {
  final CardRepository _cardRepository;

  CardAddBloc() : _cardRepository = CardRepository(), super(const CardState()) {
    on<CardAddEvent>(_onCardAdded);
  }

  Future<void> _onCardAdded(CardAddEvent event, Emitter<CardState> emit) async {
    try {
      final response = await _cardRepository.addCard(
        event.addCard,
        event.cardProductBloc,
      );

      emit(state.copyWith(status: CardStatus.success, response: response));
      event.cardProductBloc.add(CardProductFetched());
    } catch (error) {
      emit(state.copyWith(status: CardStatus.failure));
    }
  }
}

class CardDeleteBloc extends Bloc<CardDeleteEvent, CardState> {
  final CardRepository _cardRepository;

  CardDeleteBloc()
    : _cardRepository = CardRepository(),
      super(const CardState()) {
    on<CardDeleteEvent>(_onCardDeleted);
  }

  Future<void> _onCardDeleted(
    CardDeleteEvent event,
    Emitter<CardState> emit,
  ) async {
    try {
      final response = await _cardRepository.deleteCard(
        event.deleteCard,
        event.cardProductBloc,
      );

      emit(state.copyWith(status: CardStatus.success, response: response));
      event.cardProductBloc.add(CardProductFetched());
    } catch (error) {
      emit(state.copyWith(status: CardStatus.failure));
    }
  }
}
