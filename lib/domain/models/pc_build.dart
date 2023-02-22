import 'package:pc_builder_mk_mobile/domain/models/product.dart';

class PcBuild {
  Product? processor;
  Product? motherboard;
  Product? graphicsCard;
  Product? powerSupply;
  Product? pcCase;
  List<Product> ramSticks = [];
  List<Product> storageDevices = [];

  PcBuild(
      {this.processor,
      this.motherboard,
      this.graphicsCard,
      this.powerSupply,
      this.pcCase,
      required this.ramSticks,
      required this.storageDevices});

  Map<String, dynamic> toJson() => {
        'processor': processor?.toJson(),
        'motherboard': motherboard?.toJson(),
        'graphicsCard': graphicsCard?.toJson(),
        'powerSupply': powerSupply?.toJson(),
        'pcCase': pcCase?.toJson(),
        'ramSticks': ramSticks.isNotEmpty
            ? [...ramSticks.map((r) => r.toJson()).toList()]
            : [],
        'storageDevices': storageDevices.isNotEmpty
            ? [...storageDevices.map((s) => s.toJson()).toList()]
            : [],
      };

// List<Product> getAllProducts() {
//   final result = [processor, motherboard, graphicsCard, powerSupply, pcCase];
//   result.addAll(ramSticks);
//   result.addAll(storageDevices);
//
//   return result;
// }
}
