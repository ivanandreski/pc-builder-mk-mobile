import 'package:pc_builder_mk_mobile/domain/models/store_location.dart';

import '../../domain/models/product.dart';

class ProductFactory {
  static final ProductFactory _instance = ProductFactory._privateConstructor();

  ProductFactory._privateConstructor();

  static ProductFactory get instance => _instance;

  Product? createProductFromJson(Map<String, dynamic>? productMap) {
    if (productMap == null) return null;

    List<StoreLocation> productStoreLocations = (productMap['storeLocations'] as List)
        .map((sl) {
               return StoreLocation(
                  slug: sl['slug'],
                  name: sl['name'],
                  longitude: sl['longitude'],
                  latitude: sl['latitude']);
            })
        .toList();

    return Product(
      name: productMap['name'],
      slug: productMap['slug'],
      price: productMap['price'],
      imageUrl: productMap['imageUrl'],
      categorySlug: productMap['categorySlug'],
      storeName: productMap['storeName'],
      storeImageUrl: productMap['storeImageUrl'],
      isAvailable: productMap['isAvailable'],
      storeLocations: productStoreLocations,
    );
  }
}
