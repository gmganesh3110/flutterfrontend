import 'dart:convert';
import 'package:client/models/category.dart';
import 'package:client/models/product.dart';
import 'package:client/models/productfilter.dart';
import 'package:client/models/slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final apiService = Provider((ref) => ApiService());

class ApiService {
  static var client = http.Client();

  Future<List<Category>?> getCategories(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'limit': pageSize.toString(),
    };

    var url = Uri.parse("https://flutterecom.onrender.com/api/category")
        .replace(queryParameters: queryString);

    try {
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var retdata = categoryFromJson(data["data"]);
        return retdata;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'limit': productFilterModel.paginationModel.pageSize.toString(),
    };

    if (productFilterModel.categoryId != null) {
      queryString['categoryId'] = productFilterModel.categoryId!;
    }
    if (productFilterModel.soryBy != null) {
      queryString['sort'] = productFilterModel.soryBy!;
    } else {
      queryString['sort'] = "-createdAt";
    }

    var url = Uri.parse("https://flutterecom.onrender.com/api/product")
        .replace(queryParameters: queryString);

    try {
      var response = await client.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return productsFromJson(data["data"]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url = Uri.parse("https://flutterecom.onrender.com/api/auth/register");
    try {
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "fullName": fullName,
            "email": email,
            "password": password,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> loginuser(
    String email,
    String password,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    try {
      var url = Uri.parse("https://flutterecom.onrender.com/api/auth/login");
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      if (response.statusCode == 200) {
        // await ShareServices.setLoginDetails(
        // loginResponseModel(response.body.toString()));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<SlideModel>?> getSliders(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'limit': pageSize.toString(),
    };
    var url = Uri.parse("https://flutterecom.onrender.com/api/slider")
        .replace(queryParameters: queryString);
    try {
      var response = await client.get(url, headers: requestHeaders);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return slidersFromJson(data['data']);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<Product?> getProductDetails(String productId) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var url =
        Uri.parse("https://flutterecom.onrender.com/api/product/${productId}");
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Product.fromJson(data['data']);
    } else {
      return null; // Fixed: Added a return statement for the else case
    }
  }
}
