import 'package:client/components/productcard.dart';
import 'package:client/models/category.dart';
import 'package:client/models/product.dart';
import 'package:client/pages/dashboard.dart';
import 'package:client/widgets/home_products.dart';
import 'package:client/widgets/homeslider.dart';
import 'package:client/widgets/widget_home_categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            HomeSlider(),
            HomeCategories(),
            HomeProduts(),
            DashBoard()
          ],
        ),
      ),
    );
  }
}
