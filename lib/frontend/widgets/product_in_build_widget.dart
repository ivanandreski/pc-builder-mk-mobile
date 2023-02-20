import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class ProductInBuildWidget extends StatelessWidget {
  const ProductInBuildWidget({Key? key}) : super(key: key);

  // todo: replace this with Product object from pcBuildViewModel
  // if the object is null display button for selecting product from that category

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Column(children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: TitleDividerWidget(title: "Category"),
                height: 35,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3, // 20%
                  child: Column(
                    children: [
                      Container(
                          child: Image.network(
                            'https://d1a68gwbwfmqto.cloudfront.net/img/products/full/g6900box_1.jpg',
                            width: 280.0,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7, // 20%
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        alignment: Alignment.centerLeft,
                        child: Text('Intel Celeron',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: Text('Price: 3150 MKD',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Container(
                        height: 35,
                        alignment: Alignment.center,
                        child: Text('Store Anhoch',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.customDarkBlue,
                              minimumSize: Size(88, 36),
                            ),
                            onPressed: () {},
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('Details')),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.customDarkBlue,
                              minimumSize: Size(88, 36),
                            ),
                            onPressed: () {},
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('Remove')),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
