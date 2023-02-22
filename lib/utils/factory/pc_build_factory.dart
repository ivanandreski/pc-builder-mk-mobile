import 'package:pc_builder_mk_mobile/domain/models/pc_build.dart';
import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/domain/models/store_location.dart';
import 'package:pc_builder_mk_mobile/utils/factory/products_factory.dart';

class PcBuildFactory {
  static final PcBuildFactory _instance = PcBuildFactory._privateConstructor();

  PcBuildFactory._privateConstructor();

  static PcBuildFactory get instance => _instance;

  PcBuild fromJsonMap(Map<String, dynamic> pcBuildMap) {
    ProductFactory productFactory = ProductFactory.instance;

    final processor =
    productFactory.createProductFromJson(pcBuildMap['processor']);
    final motherboard =
    productFactory.createProductFromJson(pcBuildMap['motherboard']);
    final graphicsCard =
    productFactory.createProductFromJson(pcBuildMap['graphicsCard']);
    final powerSupply =
    productFactory.createProductFromJson(pcBuildMap['powerSupply']);
    final pcCase = productFactory.createProductFromJson(pcBuildMap['pcCase']);
    final ramSticks = <Product>[];
    final storageDevices = <Product>[];
    // todo: make logic for serialising theese and reading them
    // final ramSticks = pcBuildMap['ramSticks']
    //     .map((ramStick) => productFactory.createProductFromJson(ramStick))
    //     .toList();
    // final storageDevices = pcBuildMap['storageDevices']
    //     .map((storageDevice) =>
    //     productFactory.createProductFromJson(storageDevice))
    //     .toList();

    return PcBuild(
      processor: processor,
      motherboard: motherboard,
      graphicsCard: graphicsCard,
      pcCase: pcCase,
      powerSupply: powerSupply,
      ramSticks: ramSticks,
      storageDevices: storageDevices
    );
  }
}
