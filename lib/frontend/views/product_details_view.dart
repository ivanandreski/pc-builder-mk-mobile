import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product-details';
  static const title = 'Product Details'; // TODO: replace this with the name of the product

  const ProductDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => ProductDetailsScreenState();
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
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
    return (
        SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://d1a68gwbwfmqto.cloudfront.net/img/products/full/g6900box_1.jpg',
                      width: 280.0,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text("Intel Celeron 500GHz",
                      style: TextStyle(
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
                            child: Text('Available: true',
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
                  left: 15,
                  right: 15,
                ),
                child: Divider(color: Colors.black, thickness: 1),
              ),
              // ProductStoreLocationWidget(), // for each location print these
            ]))
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(ProductDetailsScreen.title),
    );
  }
}