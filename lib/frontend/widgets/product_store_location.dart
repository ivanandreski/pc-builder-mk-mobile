import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/domain/models/store_location.dart';
import 'package:pc_builder_mk_mobile/service/map_service.dart';

class ProductStoreLocationWidget extends StatelessWidget {
  final StoreLocation storeLocation;

  ProductStoreLocationWidget({super.key, required this.storeLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(88, 36),
          ),
          onPressed: () async {
            final mapService = MapService.instance;
            await mapService.openMap(storeLocation.longitude, storeLocation.latitude);
          },
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Text(storeLocation.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
