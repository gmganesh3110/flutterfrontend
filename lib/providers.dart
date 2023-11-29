import 'package:client/api/ApiService.dart';
import 'package:client/application/notifies/productfilternotifier.dart';
import 'package:client/application/notifies/productnotifier.dart';
import 'package:client/application/state/productstate.dart';
import 'package:client/models/category.dart';
import 'package:client/models/pagination.dart';
import 'package:client/models/product.dart';
import 'package:client/models/productfilter.dart';
import 'package:client/models/slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
        (ref, paginationModel) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getCategories(
      paginationModel.page, paginationModel.pageSize);
});

final productsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) async {
  final apiRepository = ref.watch(apiService);
  try {
    var result = await apiRepository.getProducts(productFilterModel);
    return result;
  } catch (e) {
    return null;
  }
});

final productsFilterProvider =
    StateNotifierProvider<ProductFilterNotifier, ProductFilterModel>(
  (ref) => ProductFilterNotifier(),
);

final productsNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(
    ref.watch(apiService),
    ref.watch(productsFilterProvider),
  ),
);

final slideProvider = FutureProvider.family<List<SlideModel>?, PaginationModel>(
    (ref, paginationModel) async {
  final apiRepository = ref.watch(apiService);
  try {
    return await apiRepository.getSliders(
        paginationModel.page, paginationModel.pageSize);
  } catch (e) {
    return null;
  }
});

final productDetailsProvider =
    FutureProvider.family<Product?, String>((ref, productId) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getProductDetails(productId);
});

final relatedProductsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) {
  final apiRepository = ref.watch(apiService);
  return apiRepository.getProducts(productFilterModel);
});
