import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer.dart';

class SelectProductScreen extends StatefulWidget {
  static const routeName = '/select-product';
  static const title = 'Select Product'; // TODO: replace this with the name of the product

  const SelectProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => SelectProductScreenState();
}

class SelectProductScreenState extends State<SelectProductScreen> {

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
        const Text(SelectProductScreen.title)
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(SelectProductScreen.title),
    );
  }
}