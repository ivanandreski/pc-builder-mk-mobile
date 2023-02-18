import 'package:pc_builder_mk_mobile/domain/models/product.dart';

abstract class ProductDatasourceInterface {
  Future<List<Product>> getProductsByCategory(String category, int page);
}