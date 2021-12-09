import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plaza/models/products_response.dart';



class ProductProvider extends ChangeNotifier {
  String _baseUrl  = 'api.bazzaio.com';
  List<ProductsResponse> prodList= [];
  //List<Product> onDisplayProducts = [];
  
  ProductProvider() {
    getOnDisplayProducts();

  }
  Future<String> _getJsonData([int page = 1] ) async {
    final url = Uri.https( _baseUrl, 'v5/listados/listar_productos_tienda/590/0');

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //print(response.body);
    return response.body;
  }

  getOnDisplayProducts() async {
     final jsonData = await this._getJsonData();
    final prodRes = ProductsResponse.fromJson(jsonData);

    prodList= [prodRes];
  
    //print(prodList);

    notifyListeners();
  }

  

}