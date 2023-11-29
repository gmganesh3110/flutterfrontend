import 'package:client/models/pagination.dart';
import 'package:client/models/category.dart';
import 'package:client/models/productfilter.dart';
import 'package:flutter/material.dart'; // Import Flutter material package for Placeholder widget
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/providers.dart';

class HomeCategories extends ConsumerWidget {
  const HomeCategories({Key? key}) : super(key: key); // Fix the key parameter

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "All Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: _categoriesList(ref),
          )
        ],
      ),
    );
  }

  Widget _categoriesList(WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        PaginationModel(page: 1, pageSize: 10),
      ),
    );

    return categories.when(
      data: (list) {
        if (list != null && list.isNotEmpty) {
          return _buildCategoryList(list, ref);
        } else {
          return const Center(
            child: Text("No slides available"),
          );
        }
      },
      error: (_, __) => const Center(
        child: Text("ERR"),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildCategoryList(List<Category> categories, WidgetRef ref) {
    return Container(
      height: 100,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              ProductFilterModel model = ProductFilterModel(
                  paginationModel: PaginationModel(page: 1, pageSize: 10),
                  categoryId: data.categoryId);

              ref
                  .read(productsFilterProvider.notifier)
                  .setProductFilterModel(model);
              ref.read(productsNotifierProvider.notifier).getProducts();
              Navigator.pushNamed(
                context,
                "/products",
                arguments: {
                  "categoryId": data.categoryId,
                  "categoryName": data.categoryName,
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Image.network(
                      data.fullImagePath,
                      height: 50,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.categoryName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right,
                          size: 13), // Remove the semicolon
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
