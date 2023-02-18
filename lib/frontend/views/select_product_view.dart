import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/domain/view_models/products_view_model.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';
import 'package:pc_builder_mk_mobile/utils/category_constants.dart';

class SelectProductScreen extends StatefulWidget {
  static const routeName = '/select-product';
  static const title =
      'Select Product'; // TODO: replace this with the name of the product

  const SelectProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => SelectProductScreenState();
}

class SelectProductScreenState extends State<SelectProductScreen> {
  final ProductsViewModel productsViewModel = ProductsViewModel();

  @override
  void initState() {
    super.initState();

    initViewModel() async {
      productsViewModel.resetViewModel("cpu");
      await productsViewModel.fetchNextPage();
      setState(() {
        productsViewModel;
      });
    }
    initViewModel();
  }

  @override
  Widget build(BuildContext context) {
    CategoryMap.categoryMap.keys;
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
    return Column(
      children: [
        DropdownButton<String>(
          value: productsViewModel.categorySlug,
          items: CategoryMap.categoryMap.keys.map((slug) {
            return DropdownMenuItem<String>(
              value: slug,
              child: Text(CategoryMap.categoryMap[slug]!),
            );
          }).toList(),
          onChanged: (value) async {
            productsViewModel.resetViewModel(value!);
            await productsViewModel.fetchNextPage();
            setState(() {
              productsViewModel;
            });
          },
        ),
        Center(
            child: productsViewModel.productsFromCategory.isEmpty
                ? const Text("List is empty")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Text(
                          productsViewModel.productsFromCategory[index].name);
                    },
                    itemCount: productsViewModel.productsFromCategory.length,
                  ))
      ],
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(SelectProductScreen.title),
    );
  }
}
