import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/product_response.dart';
import '../repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc()
    : _productRepository = ProductRepository(),
      super(const ProductState()) {
    on<ProductFetched>(_onFetched);
  }

  Future<void> _onFetched(
    ProductFetched event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final response = await _productRepository.fetchProducts();

      emit(
        state.copyWith(
          status: ProductStatus.success,
          response: ProductResponse(
            success: response.success,
            products: [...response.products],
          ),
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }
}
