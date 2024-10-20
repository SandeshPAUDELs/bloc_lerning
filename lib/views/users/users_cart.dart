import 'package:bloc_project/bloc/carts/carts_bloc.dart';
import 'package:bloc_project/bloc/carts/carts_event.dart';
import 'package:bloc_project/bloc/carts/carts_state.dart';
import 'package:bloc_project/models/cart_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCart extends StatefulWidget {
  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  late CartBloc _cartBloc;
  int? _userId;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getInt('user_id');
    if (_userId != null) {
      _cartBloc.add(FetchCart(userId: _userId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.status == CartStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == CartStatus.success && state.cart != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cart?.products.length ?? 0,
                    itemBuilder: (context, index) {
                      final product = state.cart!.products[index];
                      return _buildProductItem(product);
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * 0.3,
                      child: Column(
                        children: [
                          Text('Total: '),
                          Text('Discounted Total: '),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.66,
                        child: Column(
                          children: [
                            Text(
                              'Rs ${state.cart?.total.toStringAsFixed(2)}',
                            ),
                            Text(
                              'Rs ${state.cart?.discountedTotal.toStringAsFixed(2)}',
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).height * 0.079,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                product.thumbnail,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.66,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        height: 1.2,
                      ),
                ),
                Text(
                  'Rs. ${product.price}/-',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                Text('Quantity: ${product.quantity}'),
                Text('Total: Rs ${product.total}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
