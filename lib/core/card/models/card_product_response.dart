import 'card-product.dart';

final class CardProductResponse {
  final int success;
  final List<CardProduct> cardProducts;

  const CardProductResponse({
    required this.success,
    required this.cardProducts,
  });

  factory CardProductResponse.fromJson(Map<String, dynamic> json) =>
      CardProductResponse(
        success: json['success'] as int,
        cardProducts:
            (json['urunler_sepeti'] as List)
                .map((article) => CardProduct.fromJson(article))
                .toList(),
      );

  @override
  List<Object> get props => [success, cardProducts];
}
