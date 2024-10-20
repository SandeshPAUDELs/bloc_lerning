
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCart extends CartEvent {
  final int userId;

  const FetchCart({required this.userId});

  @override
  List<Object> get props => [userId];
}
