import 'package:client/models/pagination.dart';
import 'package:client/models/productfilter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductFilterNotifier extends StateNotifier<ProductFilterModel> {
  ProductFilterNotifier()
      : super(
          ProductFilterModel(
            paginationModel: PaginationModel(page: 0, pageSize: 10),
          ),
        );
  void setProductFilterModel(ProductFilterModel model) {
    state = model;
  }
}
