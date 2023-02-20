import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/repository/remote_product_datasource.dart';

class ProductsViewModel with ChangeNotifier  {
  final List<Product> productsFromCategory = [];
  var categorySlug = "cpu";
  var currentPage = 0;

  void resetViewModel(String categorySlug) {
      productsFromCategory.clear();
      this.categorySlug = categorySlug;
      currentPage = 0;
  }

  Future<void> fetchNextPage() async {
    // todo: store total pages var from response and check if current page is last

    try {
      final remoteProductDatasource = RemoteProductDatasource.instance;
      final newProducts = await remoteProductDatasource.getProductsByCategory(categorySlug, currentPage++);
      productsFromCategory.addAll(newProducts);
    } catch(exc) {
      print('Error in _fetchData : ${exc.toString()}');
    }
  }

}