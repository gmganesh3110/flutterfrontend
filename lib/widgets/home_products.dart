import 'package:client/components/productcard.dart';
import 'package:client/models/pagination.dart';
import 'package:client/models/product.dart';
import 'package:client/models/productfilter.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeProduts extends ConsumerWidget {
  const HomeProduts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0xffF4F7Fa),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 15,
                ),
                child: Text(
                  "Top 10 Products",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: _productsList(ref),
          ),
        ],
      ),
    );
  }

  Widget _productsList(WidgetRef ref) {
    final products = ref.watch(
      productsProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(
            page: 1,
            pageSize: 10,
          ),
        ),
      ),
    );
    return products.when(
        data: (list) {
          return _buildProductList(list!);
        },
        error: (_, __) => const Center(
              child: Text("ERR"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(model: data),
          );
        },
      ),
    );
  }
}
