import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:pc_builder_mk_mobile/domain/view_models/products_view_model.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';
import 'package:pc_builder_mk_mobile/utils/category_constants.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/select_product_wiget.dart';

class SelectProductScreen extends StatefulWidget {
  static const routeName = '/select-product';
  static const title =
      'Select Product'; // TODO: replace this with the name of the product

  const SelectProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => SelectProductScreenState();
}

class SelectProductScreenState extends State<SelectProductScreen> {
  late ProductsViewModel productsViewModel;

  final controller = ScrollController();

  var search = "";
  Timer? searchOnStoppedTyping;

  @override
  void initState() {
    productsViewModel = Provider.of<ProductsViewModel>(context, listen: false);

    super.initState();

    initViewModel() async {
      productsViewModel.resetViewModel("cpu");
      await productsViewModel.fetchNextPage();
      setState(() {
        productsViewModel;
      });
    }

    initViewModel();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  _handleSearchChange(value) {
    setState(() {
      search = value;
    });
  }
  _onChangeHandler(value ) {
    const duration = Duration(milliseconds:800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping?.cancel()); // clear timer
    }
    setState(() => searchOnStoppedTyping = Timer(duration, () => _handleSearchChange(value)));
  }

  Future<void> fetchNextPage() async {
    await productsViewModel.fetchNextPage();
    setState(() {
      productsViewModel;
    });
  }

  List<DropdownMenuItem<String>> _mapDropdownCategoryItems() {
    return CategoryMap.categoryMap.keys.map((slug) {
      return DropdownMenuItem<String>(
        value: slug,
        child: Text(CategoryMap.categoryMap[slug]!),
      );
    }).toList();
  }

  Future<void> _handleCategoryChange(category) async {
    productsViewModel.resetViewModel(category);
    await productsViewModel.fetchNextPage();
    setState(() {
      productsViewModel;
    });
  }

  List<dynamic> _mapProductsToWidget() {
    return productsViewModel.productsFromCategory
        .where((product) =>
            search.isEmpty ||
            product.name.toLowerCase().contains(search.toLowerCase()))
        .map((product) => SelectProductWidget(product: product))
        .toList();
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
        Container(
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                value: productsViewModel.categorySlug,
                items: _mapDropdownCategoryItems(),
                onChanged: (value) async {
                  await _handleCategoryChange(value);
                },
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 15, left: 10, right: 10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
              ),
              // onChanged: (text) {
              //   setState(() {
              //     search = text;
              //   });
              // },
              onChanged: _onChangeHandler,
            ),
          ),
        ),
        Expanded(
            child: GridView.count(
                controller: controller,
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: <Widget>[..._mapProductsToWidget()])),
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
