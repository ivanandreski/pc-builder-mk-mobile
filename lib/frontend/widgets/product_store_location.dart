import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class ProductStoreLocationWidget extends StatelessWidget {
  const ProductStoreLocationWidget({Key? key}) : super(key: key);

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
            primary: Colors.white,
            minimumSize: Size(88, 36),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Text('Anhoch GTC',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Text('Anhoch',
                          style: TextStyle(
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
