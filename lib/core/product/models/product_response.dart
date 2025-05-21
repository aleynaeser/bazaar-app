import 'product.dart';

final class ProductResponse {
  final int success;
  final List<Product> products;

  const ProductResponse({required this.success, required this.products});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        success: json['success'] as int,
        products:
            (json['urunler'] as List)
                .map((article) => Product.fromJson(article))
                .toList(),
      );

  @override
  List<Object> get props => [success, products];
}
