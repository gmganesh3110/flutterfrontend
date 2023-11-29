import 'package:client/components/widgetcolexp.dart';
import 'package:client/components/widgetstepper.dart';
import 'package:client/models/product.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetails> {
  String productId = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: SingleChildScrollView(
        child: _productDetails(ref),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments != null) {
      productId = arguments['productId'];
    }
    super.didChangeDependencies();
  }

  Widget _productDetails(WidgetRef ref) {
    final detail = ref.watch(productDetailsProvider(productId));
    return detail.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_productDetailsUI(model!)],
          );
        },
        error: (_, __) => const Center(
              child: Text("ERR"),
            ),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _productDetailsUI(Product model) {
    print(model.productPrice);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.network(
              model.fullImagePath,
              fit: BoxFit.fitHeight,
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            model.productName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "@${model.productPrice.toString()}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: model.calculateDiscount > 0
                          ? Colors.red
                          : Colors.black,
                      decoration: model.productSalePrice > 0 ? null : null,
                    ),
                  ),
                  Text(
                    (model.calculateDiscount > 0)
                        ? "@${model.productSalePrice.toString()}"
                        : "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Text(
                  "SHARE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                label: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 20,
                ),
              )
            ],
          ),
          Text(
            "Availability: ${model.stockStatus}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "Product Code: ${model.productSKU}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomStepper(
                  iconsize: 22.0,
                  lowerlimit: 1,
                  onChanged: (value) {},
                  stepvalue: 1,
                  upperlimit: 20,
                  value: 1),
              TextButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                ),
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                label: const Text(
                  "Add to Cart  ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ColExpand(
              title: "SHORT DESCRIPTION",
              content: model.productShortDescription),
          const SizedBox(
            height: 15,
          ),
          ColExpand(title: "DESCRIPTION", content: model.productDescription),
        ],
      ),
    );
  }
}
