import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/domain/models/product.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/product_store_location.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';

  const ProductDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late final Product product;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _createAppBar(context),
      ),
      drawer: const NavigationDrawer(),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return (SingleChildScrollView(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: Container(
            alignment: Alignment.center,
            child: Image.network(
              product.imageUrl,
              width: 280.0,
            )),
      ),
      Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: Text(product.name,
              style: const TextStyle(
                fontSize: 24,
              ))),
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
                    child: Text('Price: ${product.price} MKD',
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
                    child: Row(
                      children: [
                        const Text('Available: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Icon(
                          product.isAvailable ? Icons.check : Icons.close,
                          color: product.isAvailable
                              ? Colors.lightGreen
                              : Colors.red,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Divider(color: Colors.black, thickness: 1),
      ),
      Column(
        children: [
          ...product.storeLocations.map((s) {
            return ProductStoreLocationWidget(storeLocation: s);
          }).toList()
        ],
      )
    ])));
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      title: Text(product.name),
    );
  }
}
