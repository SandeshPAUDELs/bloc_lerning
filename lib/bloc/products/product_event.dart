import 'package:equatable/equatable.dart';
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {}

class FetchProductDetails extends ProductsEvent {
  final int productId;

  FetchProductDetails(this.productId);

  @override
  List<Object> get props => [productId];
}
