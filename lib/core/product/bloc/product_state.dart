part of 'product_bloc.dart';

enum ProductStatus { initial, success, failure }

final class ProductState extends Equatable {
  final ProductStatus status;
  final ProductResponse response;

  const ProductState({
    this.status = ProductStatus.initial,
    this.response = const ProductResponse(success: 0, products: []),
  });

  ProductState copyWith({ProductResponse? response, ProductStatus? status}) {
    return ProductState(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''ProductState { response: ${response.products.length}, status: $status }''';
  }

  @override
  List<Object> get props => [response, status];
}
