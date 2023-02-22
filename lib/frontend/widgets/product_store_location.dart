import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class ProductStoreLocationWidget extends StatelessWidget {
  final String slug;
  final String name;

  ProductStoreLocationWidget({required this.slug, required this.name});

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
          onPressed: () {},
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Text(name,
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
