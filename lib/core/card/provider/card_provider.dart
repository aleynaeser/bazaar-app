import 'dart:convert';
import 'package:dio/dio.dart';
import '../bloc/card_bloc.dart';
import '../models/card_actions/add_card.dart';
import '../models/card_product_response.dart';
import '../models/card_actions/delete_card.dart';
import '../models/card_actions/card_action_response.dart';
import '../../../common/constants/base_constants.dart';

const String path = "urunler";

class CardProvider {
  Future<CardProductResponse> fetchCardProducts() async {
    var formData = FormData.fromMap({"kullaniciAdi": BaseInfo.username});

    final response = await Dio().post(
      "${BaseInfo.apiUrl}/$path/sepettekiUrunleriGetir.php",
      data: formData,
    );

    print("response: $response");

    if (response.statusCode == 200) {
      final body = response.data;
      final cardProductResponse = CardProductResponse.fromJson(
        json.decode(body),
      );
      print("cardProductResponse: $cardProductResponse");
      return cardProductResponse;
    }

    throw Exception('Error fetching card products...');
  }

  Future<CardResponse> addCard(AddCard addCard) async {
    final response = await Dio().post(
      "${BaseInfo.apiUrl}/$path/sepeteUrunEkle.php",
      data: FormData.fromMap(addCard.toJson()),
    );

    if (response.statusCode == 200) {
      final body = response.data;
      final cardResponse = CardResponse.fromJson(json.decode(body));
      return cardResponse;
    }

    throw Exception('Error adding card...');
  }

  Future<CardResponse> deleteCard(DeleteCard deleteCard) async {
    final response = await Dio().post(
      "${BaseInfo.apiUrl}/$path/sepettenUrunSil.php",
      data: FormData.fromMap(deleteCard.toJson()),
    );

    if (response.statusCode == 200) {
      final body = response.data;
      final cardResponse = CardResponse.fromJson(json.decode(body));
      return cardResponse;
    }

    throw Exception('Error deleting card...');
  }
}
