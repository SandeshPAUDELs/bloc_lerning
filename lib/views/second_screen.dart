import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/bloc/products/product_bloc.dart';
import 'package:bloc_project/bloc/products/product_event.dart';
import 'package:bloc_project/bloc/products/product_state.dart';
import 'package:bloc_project/models/products_models.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(FetchProducts()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.status == ProductStatus.initial) {
              return Center(child: CircularProgressIndicator());
            } else if (state.status == ProductStatus.success) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  Products product = state.products[index];
                  return ListTile(
                    leading: Image.network(product.image ?? ''),
                    title: Text(product.title ?? 'No title'),
                    subtitle: Text('\$${product.price?.toString() ?? 'N/A'}'),
                  );
                },
              );
            } else if (state.status == ProductStatus.failure) {
              return Center(child: Text('Failed to load products'));
            } else {
              return Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
