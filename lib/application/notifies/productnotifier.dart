import 'package:client/api/ApiService.dart';
import 'package:client/application/state/productstate.dart';
import 'package:client/models/pagination.dart';
import 'package:client/models/productfilter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ApiService _apiService;
  final ProductFilterModel _filterModel;
  ProductNotifier(this._apiService, this._filterModel)
      : super(const ProductState());

  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    state = state.copyWith(isLoading: true);
    var filtermodel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page: _page,
        pageSize: 10,
      ),
    );
    final products = await _apiService.getProducts(filtermodel);
    final newproducts = [...state.products, ...products!];
    if (products.length % 10 != 0 || products.isEmpty) {
      Future.delayed(const Duration(microseconds: 1500), () {
        state = state.copyWith(products: newproducts);
        _page++;

        state = state.copyWith(isLoading: false);
      });
    }
  }

  Future<void> refreshProducts() async {
    state = state.copyWith(
      products: [],
      hasNext: true,
    );
    _page = 1;
    await getProducts();
  }
}
