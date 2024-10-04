import 'package:bloc_project/models/products_models.dart';
import 'package:equatable/equatable.dart';
enum ProductStatus { initial, success, failure }

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const <Products>[],
    this.message = '',
    


  });

  final ProductStatus status;
  final List<Products> products;
  final String message;

  ProductState copyWith({
    ProductStatus? status,
    List<Products>? products,
    String? message,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      message: message ?? this.message,
    );
  }
  @override
  String toString() {
    return 'ProductState { status: $status, products: ${products.length}, message: $message }';
  }


  @override
  // TODO: implement props
  List<Object?> get props => [status, products, message];

}