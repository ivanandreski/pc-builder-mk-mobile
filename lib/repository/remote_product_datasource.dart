import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/repository/product_datasource_interface.dart';
import 'package:pc_builder_mk_mobile/utils/factory/products_factory.dart';
import 'package:pc_builder_mk_mobile/utils/constants.dart';

// instantiiate example: RemoteProductDatasource remoteProductDatasource = RemoteProductDatasource.instance;
class RemoteProductDatasource extends ProductDatasourceInterface {
  static final RemoteProductDatasource _instance =
      RemoteProductDatasource._privateConstructor();

  RemoteProductDatasource._privateConstructor();

  static RemoteProductDatasource get instance => _instance;

  @override
  Future<List<Product>> getProductsByCategory(String category, int page) async {
    final url = Uri.parse(
        '${Constants.apiUrl}/product?category=${category}&page=${page}&pageSize=12');
    final response = await http.get(url);
    final products = <Product>[];
    if (response.statusCode == 200) {
      ProductFactory productFactory = ProductFactory.instance;
      final Map<String, dynamic> data = json.decode(response.body);
      for (final productJson in data['content']['content']) {
        products.add(productFactory.createProductFromJson(productJson)!);
      }
    }

    return products;
  }
}
