import 'package:bloc_project/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/bloc/products/product_bloc.dart';
import 'package:bloc_project/bloc/products/product_event.dart';
import 'package:bloc_project/bloc/products/product_state.dart';
import 'package:bloc_project/models/products_models.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
        context.read<ProductBloc>().add(FetchProducts());

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.initial) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ProductStatus.failure) {
            return Center(child: Text('Failed to fetch products'));
          }
      
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              Products product = state.products[index];
              return GestureDetector(
                onTap: () {
                if (product.id != null) {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleProductScreen(productId: product.id!),
                  ),
                  );
                }
                },
                child: ListTile(
                leading: Image.network(product.image ?? ''),
                title: Text(product.title ?? ''),
                subtitle: Text('\$${product.price?.toString() ?? 'N/A'}'),
                ),
              );
             
            },
          );
        },
      ),
    );
  }
}
