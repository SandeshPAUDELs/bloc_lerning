import 'package:bloc_project/models/products_models.dart';
import 'package:equatable/equatable.dart';
enum ProductStatus { initial, success, failure }

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const <Products>[],
    this.productDetails,
    this.message = '',

  });

  final ProductStatus status;
  final List<Products> products;
  final Products? productDetails;
  final String message;

  ProductState copyWith({
    ProductStatus? status,
    List<Products>? products,
    Products? productDetails,
    String? message,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      productDetails: productDetails ?? this.productDetails,
      message: message ?? this.message,
    );
  }
  // @override
  // String toString() {
  //   return 'ProductState { status: $status, products: ${products.length}, productDetails: $productDetails, message: $message }';
  // }


  @override
  // TODO: implement props
  List<Object?> get props => [status, products, productDetails, message];


  

}