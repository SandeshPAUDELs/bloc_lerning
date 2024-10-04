import 'package:bloc/bloc.dart';
import 'package:bloc_project/bloc/products/product_event.dart';
import 'package:bloc_project/bloc/products/product_state.dart';
import 'package:bloc_project/models/products_models.dart';
import 'package:bloc_project/respository/products_repo.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductState>{

  ProductsRepo productsRepo = ProductsRepo();
  List<Products?> products = [];

  ProductBloc() : super(const ProductState()){
    on<FetchProducts>(_fetchProducts);
    on<FetchProductDetails>(_fetchProductDetails);

  }

  Future<void> _fetchProducts(FetchProducts event, Emitter<ProductState> emit) async {
    await productsRepo.getProducts().then((value) {
      emit(state.copyWith(status: ProductStatus.success, products: value, message: 'success'));
    });
  }
  Future<void> _fetchProductDetails(FetchProductDetails event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.initial));
    try {
      final product = await ProductsRepo.getProduct(event.productId);
      emit(state.copyWith(status: ProductStatus.success, productDetails: product));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure, message: 'Failed to load product details'));
    }
  }

  
}