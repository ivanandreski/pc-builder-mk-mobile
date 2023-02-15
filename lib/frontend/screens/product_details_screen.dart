import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer.dart';

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
        const Text(ProductDetailsScreen.title)
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(ProductDetailsScreen.title),
    );
  }
}