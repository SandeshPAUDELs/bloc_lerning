import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/carts/carts_event.dart';
import 'package:bloc_project/bloc/carts/carts_state.dart';

import 'package:bloc_project/respository/carts_repo.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepo cartRepo = CartRepo();

  CartBloc() : super(const CartState()) {
    on<FetchCart>(_fetchCart);
  }

  Future<void> _fetchCart(FetchCart event, Emitter<CartState> emit) async {
    try {
      emit(state.copyWith(status: CartStatus.initial));
      final cart = await cartRepo.fetchCart(event.userId);
      if (cart != null) {
        emit(state.copyWith(
          status: CartStatus.success,
          cart: cart,
          message: 'Cart fetched successfully',
        ));
      } else {
        emit(state.copyWith(
          status: CartStatus.failure,
          message: 'Failed to fetch cart',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.failure,
        message: 'Failed to fetch cart',
      ));
    }
  }
}
