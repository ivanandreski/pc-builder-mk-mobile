import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/repository/product_datasource_interface.dart';

// instantiiate example: RemoteProductDatasource remoteProductDatasource = RemoteProductDatasource.instance;
class RemoteProductDatasource extends ProductDatasourceInterface {
  static final RemoteProductDatasource _instance = RemoteProductDatasource._privateConstructor();

  RemoteProductDatasource._privateConstructor();

  static RemoteProductDatasource get instance => _instance;

  @override
  List<Product> getProductsByCategory(String category, int page) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }

}