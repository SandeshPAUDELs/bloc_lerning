import 'package:equatable/equatable.dart';
import 'package:bloc_project/models/cart_models.dart';

enum CartStatus { initial, success, failure }

class CartState extends Equatable {
  const CartState({
    this.status = CartStatus.initial,
    this.message = '',
    this.cart,
  });

  final CartStatus status;
  final String message;
  final Cart? cart;

  CartState copyWith({
    CartStatus? status,
    String? message,
    Cart? cart,
  }) {
    return CartState(
      status: status ?? this.status,
      message: message ?? this.message,
      cart: cart ?? this.cart,
    );
  }

  @override
  List<Object?> get props => [status, message, cart];
}
