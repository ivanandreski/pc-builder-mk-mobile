import 'dart:convert';
import 'package:hive/hive.dart';

import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/utils/factory/pc_build_factory.dart';
import 'package:pc_builder_mk_mobile/domain/models/pc_build.dart';

class PcBuildRepository {
  static final PcBuildRepository _instance =
  PcBuildRepository._privateConstructor();

  PcBuildRepository._privateConstructor();

  static PcBuildRepository get instance => _instance;

  Future<PcBuild> getPcBuild() async {
    var box = await Hive.openBox('localstorage');
    if (!box.containsKey('pc_build')) {
      final pcBuild = PcBuild(ramSticks: <Product>[], storageDevices: <Product>[]);
      await box.put('pc_build', json.encode(pcBuild.toJson()));
      return pcBuild;
    }

    final jsonPcBuild = box.get('pc_build');
    final Map<String, dynamic> pcBuildMap = json.decode(jsonPcBuild);

    PcBuildFactory pcBuildFactory = PcBuildFactory.instance;

    return pcBuildFactory.fromJsonMap(pcBuildMap);
  }

  Future<void> storePcBuild(pcBuild) async {
    var box = await Hive.openBox('localstorage');

    await box.put('pc_build', json.encode(pcBuild.toJson()));
  }
}
