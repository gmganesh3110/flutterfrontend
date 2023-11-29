import 'package:client/components/productcard.dart';
import 'package:client/models/pagination.dart';
import 'package:client/models/productfilter.dart';
import 'package:client/models/productsort.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductFilters(
              categoryId: categoryId,
              categoryName: categoryName,
            ),
            Flexible(
              child: _ProductList(),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      categoryId = arguments['categoryId'];
      categoryName = arguments['categoryName'];
    }
    super.didChangeDependencies();
  }
}

class _ProductFilters extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(value: "createdAt", label: "Latest"),
    ProductSortModel(value: "-productPrice", label: "Price: High to Low"),
    ProductSortModel(value: "productPrice", label: "Price: Low to High")
  ];
  _ProductFilters({
    Key? key,
    this.categoryName,
    this.categoryId,
  });

  final String? categoryName;
  final String? categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productsFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              categoryName!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[500],
            ),
            child: PopupMenuButton(
              initialValue: filterProvider.soryBy,
              onSelected: (sortBy) {
                ProductFilterModel productFilterModel = ProductFilterModel(
                    paginationModel: PaginationModel(
                      page: 0,
                      pageSize: 10,
                    ),
                    categoryId: filterProvider.categoryId,
                    soryBy: sortBy.toString());
                ref
                    .read(productsFilterProvider.notifier)
                    .setProductFilterModel(productFilterModel);
                ref.read(productsNotifierProvider.notifier).getProducts();
              },
              itemBuilder: (BuildContext context) {
                return _sortByOptions.map((item) {
                  return PopupMenuItem(
                    value: item.value,
                    child: InkWell(
                      child: Text(item.label!),
                    ),
                  );
                }).toList();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          )
        ],
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final productsViewModel = ref.read(productsNotifierProvider.notifier);
        final productsState = ref.watch(productsNotifierProvider);
        if (!productsState.hasNext) {
          productsViewModel.getProducts();
        }
      }
    });

    if (productsState.products.isEmpty) {
      if (!productsState.hasNext && !productsState.isLoading) {
        return const Center(
          child: Text("No Products"),
        );
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(productsNotifierProvider.notifier).refreshProducts();
      },
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              controller: _scrollController,
              children: List.generate(
                productsState.products.length,
                (index) {
                  return ProductCard(model: productsState.products[index]);
                },
              ),
            ),
          ),
          Visibility(
              visible:
                  productsState.isLoading && productsState.products.isNotEmpty,
              child: Container(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(),
              ))
        ],
      ),
    );
  }
}
