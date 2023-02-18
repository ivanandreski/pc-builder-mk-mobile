import 'package:pc_builder_mk_mobile/domain/models/product.dart';

class PcBuild {
  late Product processor;
  late Product motherboard;
  late Product graphicsCard;
  late Product powerSupply;
  late Product pcCase;
  List<Product> ramSticks = [];
  List<Product> storageDevices = [];

  

  List<Product> getAllProducts() {
    final result = [processor, motherboard, graphicsCard, powerSupply, pcCase];
    result.addAll(ramSticks);
    result.addAll(storageDevices);

    return result;
  }
}