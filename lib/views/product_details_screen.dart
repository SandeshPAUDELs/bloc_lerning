import 'package:bloc_project/bloc/products/product_bloc.dart';
import 'package:bloc_project/bloc/products/product_event.dart';
import 'package:bloc_project/bloc/products/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductScreen extends StatelessWidget {
  final int productId;

  const SingleProductScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchProductDetails(productId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == ProductStatus.failure) {
            return Center(child: Text('Failed to load product details: ${state.message}'));
          } else if (state.productDetails == null) {
            return const Center(child: Text('Product not found.'));
          }

          final product = state.productDetails!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.image != null)
                  Image.network(product.image!, height: 200)
                else
                  const Placeholder(fallbackHeight: 200),
                Text(
                  product.title ?? 'No title available',
                ),
                Text(
                  product.price != null ? 'Rs${product.price!.toString()}' : 'Price not available',
                ),
                Text(
                  product.description ?? 'No description available',
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
