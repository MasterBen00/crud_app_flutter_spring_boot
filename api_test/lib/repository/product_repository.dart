import 'dart:convert';

import 'package:api_test/model/product.dart';
import 'package:api_test/util/api_util.dart';
import 'package:http/http.dart';

class ProductRepository {
  Future<List<Product>> fetchAllProduct() async {
    var response = await get(Uri.http(apiBaseUrl, fetchAllUrl),
        headers: {'Content-Type': 'application/json'});

    var extractedResponse = json.decode(response.body);

    List<Product> products = [];

    for (int i = 0; i < extractedResponse.length; i++) {
      products.add(Product.fromJson(extractedResponse[i]));
    }

    return products;
  }

  Future<dynamic> createProduct(Map<String, dynamic> productInformation) async {
    var response = await post(Uri.http(apiBaseUrl, createUrl),
        body: jsonEncode(productInformation),
        headers: {'Content-Type': 'application/json'});

    return json.decode(response.body);
  }

  Future<dynamic> editProduct(Product productInformation) async {
    String id = productInformation.id;
    var response = await post(Uri.http(apiBaseUrl, '$editUrl/$id'),
        body: jsonEncode(productInformation),
        headers: {'Content-Type': 'application/json'});

    return json.decode(response.body);
  }

  void deleteProduct(String id) async {
    var response = await delete(Uri.http(apiBaseUrl, '$deleteUrl/$id'),
        headers: {'Content-Type': 'application/json'});

    print(response);
  }
}

ProductRepository productRepository = ProductRepository();
