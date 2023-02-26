import 'package:pc_builder_mk_mobile/domain/models/store_location.dart';

class Product {
  late final String name;
  late final String slug;
  late final double price;
  late final String imageUrl;
  late final String categorySlug;
  late final String storeName;
  late final String storeImageUrl;
  late final bool isAvailable;
  late final List<StoreLocation> storeLocations;

  Product({
    required this.name,
    required this.slug,
    required this.price,
    required this.imageUrl,
    required this.categorySlug,
    required this.storeName,
    required this.storeImageUrl,
    required this.isAvailable,
    required this.storeLocations
  });

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'slug': slug,
        'price': price,
        'imageUrl': imageUrl,
        'categorySlug': categorySlug,
        'storeName': storeName,
        'storeImageUrl': storeImageUrl,
        'isAvailable': isAvailable,
        'storeLocations': storeLocations.isNotEmpty
            ? [...storeLocations.map((sl) => sl.toJson()).toList()]
            : [],
      };
}
