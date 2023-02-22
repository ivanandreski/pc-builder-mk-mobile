import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/frontend/views/product_details_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/select_product_view.dart';
import 'package:pc_builder_mk_mobile/utils/category_constants.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class ProductInBuildWidget extends StatelessWidget {
  Product? product;
  String category;
  Function onTapDelete;

  ProductInBuildWidget(
      {this.product, required this.category, required this.onTapDelete});

  _handleDetailsClick(context) {
    Navigator.pushNamed(context, ProductDetailsScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: TitleDividerWidget(title: category),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.customDarkBlue,
                    minimumSize: const Size(88, 36),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, SelectProductScreen.routeName);
                  },
                  child: const Align(
                      alignment: Alignment.center, child: Text("Add product")),
                ),
              )
            ],
          )
        : SizedBox(
            height: 300,
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TitleDividerWidget(title: category),
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
                          Image.network(
                            product?.imageUrl ?? "",
                            width: 280.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7, // 20%
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 35,
                              alignment: Alignment.centerLeft,
                              child: Text(product?.name ?? "Name placeholder",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
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
                            child: Text('Price: ${product?.price} MKD',
                                style: const TextStyle(
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
                            child: Text('Store ${product?.storeName}',
                                style: const TextStyle(
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
                                  minimumSize: const Size(88, 36),
                                ),
                                onPressed: () {
                                  _handleDetailsClick(context);
                                },
                                child: const Align(
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
                                onPressed: () async {
                                  await onTapDelete(product);
                                },
                                child: const Align(
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
