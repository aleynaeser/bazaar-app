import '../models/card_actions/add_card.dart';
import '../models/card_actions/delete_card.dart';
import '../models/card_product_response.dart';
import '../provider/card_provider.dart';
import '../models/card_actions/card_action_response.dart';
import '../../../core/card/bloc/card_bloc.dart';

class CardRepository {
  final CardProvider _cardProvider = CardProvider();

  Future<CardProductResponse> fetchCardProducts() async {
    return await _cardProvider.fetchCardProducts();
  }

  Future<CardResponse> addCard(
    AddCard addCard,
    CardProductBloc cardProductBloc,
  ) async {
    return await _cardProvider.addCard(addCard);
  }

  Future<CardResponse> deleteCard(
    DeleteCard deleteCard,
    CardProductBloc cardProductBloc,
  ) async {
    return await _cardProvider.deleteCard(deleteCard);
  }
}
