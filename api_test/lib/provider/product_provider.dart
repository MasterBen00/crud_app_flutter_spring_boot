import 'package:api_test/model/product.dart';
import 'package:api_test/repository/product_repository.dart';
import 'package:flutter/material.dart';

enum Status { dataFetched, dataNotFetched, editMode, createMode }

class ProductProvider extends ChangeNotifier {
  List<Product> productList = [];
  Product product;
  String productId;

  Status _dataFetchStatus = Status.dataNotFetched;

  Status get dataFetchStatus => _dataFetchStatus;

  Status _modeStatus = Status.createMode;

  Status get modeStatus => _modeStatus;

  void updateModeStatus(Status mode) {
    _modeStatus = mode;
    if (modeStatus == Status.createMode) {
      modeInfo['mode'] = 'Create';
    } else if (modeStatus == Status.editMode) {
      modeInfo['mode'] = 'Edit';
    }

    notifyListeners();
  }

  void getAllProducts() async {
    productList = await productRepository.fetchAllProduct();

    if (productList.isNotEmpty) {
      _dataFetchStatus = Status.dataFetched;
      notifyListeners();
    }

    notifyListeners();
  }

  void updateProduct(Product newProduct) {
    product = newProduct;
    // productInformation['id'] = newProduct.id;
    // productInformation['title'] = newProduct.title;
    // productInformation['description'] = newProduct.description;
    notifyListeners();
  }

  Map<String, dynamic> modeInfo = {'mode': ''};

  Map<String, dynamic> productInformation = {
    'id': '',
    'title': '',
    'description': ''
  };

  void createProduct() async {
    var response = await productRepository.createProduct(productInformation);
    print(response);
  }

  void editProduct() async {
    var response = await productRepository.editProduct(product);
    print(response);
  }

  void deleteProduct() async {
    productRepository.deleteProduct(product.id);
  }
}
