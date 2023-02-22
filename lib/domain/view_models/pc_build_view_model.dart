import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:pc_builder_mk_mobile/domain/models/pc_build.dart';
// import 'package:pc_builder_mk_mobile/domain/models/pc_build_compatibility.dart';
import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/service/remote_pc_build_service.dart';
import 'package:pc_builder_mk_mobile/repository/local_pc_build_repository.dart';

class PcBuildViewModel with ChangeNotifier {
  PcBuild? pcBuild;
  // PcBuildCompatibility? pcBuildCompatibility;

  _storeChanges() async {
    final pcBuildRepository = PcBuildRepository.instance;
    await pcBuildRepository.storePcBuild(pcBuild);
  }

  // checkCompatibility() async {
  //   final remotePcBuildService = RemotePcBuildService.instance;
  //   pcBuildCompatibility = await remotePcBuildService.checkCompatibility(pcBuild);
  // }

  double calculateTotalPrice() {
    double total = 0.0;
    total += pcBuild?.processor?.price ?? 0;
    total += pcBuild?.motherboard?.price ?? 0;
    total += pcBuild?.graphicsCard?.price ?? 0;
    total += pcBuild?.pcCase?.price ?? 0;
    total += pcBuild?.powerSupply?.price ?? 0;
    // total += pcBuild?.processor?.price ?? 0;
    // total += pcBuild?.processor?.price ?? 0;

    return total;
  }

  Future<void> putProduct(product, category) async {
    switch (category) {
      case 'case':
        pcBuild?.pcCase = product;
        break;
      case 'gpu':
        pcBuild?.graphicsCard = product;
        break;
      case 'mb':
        pcBuild?.motherboard = product;
        break;
      case 'psu':
        pcBuild?.powerSupply = product;
        break;
      case 'cpu':
        pcBuild?.processor = product;
        break;
      case 'ram':
        pcBuild?.ramSticks.add(product);
        break;
      case 'storage':
        pcBuild?.storageDevices.add(product);
        break;
    }

    await _storeChanges();
    // await checkCompatibility();
  }

  Future<void> removeProduct(Product product) async {
    switch (product.categorySlug) {
      case 'case':
        pcBuild?.pcCase = null;
        break;
      case 'gpu':
        pcBuild?.graphicsCard = null;
        break;
      case 'mb':
        pcBuild?.motherboard = null;
        break;
      case 'psu':
        pcBuild?.powerSupply = null;
        break;
      case 'cpu':
        pcBuild?.processor = null;
        break;
      case 'ram':
        pcBuild?.ramSticks = pcBuild?.ramSticks
            .where((ramStick) => ramStick.slug != product.slug)
            .toList() ??
            [];
        break;
      case 'storage':
        pcBuild?.storageDevices = pcBuild?.storageDevices
            .where((storageDevice) => storageDevice.slug != product.slug)
            .toList() ??
            [];
        break;
    }

    await _storeChanges();
    // await checkCompatibility();
  }
}
