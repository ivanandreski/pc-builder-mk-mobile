import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pc_builder_mk_mobile/domain/view_models/pc_build_view_model.dart';
import 'package:pc_builder_mk_mobile/domain/models/product.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/product_in_build_widget.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart' as custom_nav_drawer;
import 'package:pc_builder_mk_mobile/frontend/widgets/summary_widget.dart';
import 'package:pc_builder_mk_mobile/utils/category_constants.dart';

import '../../repository/local_pc_build_repository.dart';

class PcBuilderScreen extends StatefulWidget {
  static const routeName = '/pc-builder-screen';
  static const title = 'PC Build';

  const PcBuilderScreen({super.key});

  @override
  State<StatefulWidget> createState() => PcBuilderScreenState();
}

class PcBuilderScreenState extends State<PcBuilderScreen> {
  late PcBuildViewModel pcBuildViewModel;

  @override
  void initState() {
    pcBuildViewModel = Provider.of<PcBuildViewModel>(context, listen: false);

    super.initState();

    initViewModel() async {
      if (pcBuildViewModel.pcBuild == null) {
        final pcBuildRepository = PcBuildRepository.instance;
        pcBuildViewModel.pcBuild = await pcBuildRepository.getPcBuild();
      }
      setState(() {
        pcBuildViewModel;
      });
    }

    initViewModel();
  }

  _handleRemoveProductClick(Product product) async {
    await pcBuildViewModel.removeProduct(product);
    setState(() {
      pcBuildViewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: _createAppBar(context),
      ),
      drawer: const custom_nav_drawer.NavigationDrawer(),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: SummaryWidget(price: pcBuildViewModel.calculateTotalPrice(), compatible: true)),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ProductInBuildWidget(product: pcBuildViewModel.pcBuild?.processor, category: CategoryTitles.cpuTitle, onTapDelete: _handleRemoveProductClick)
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ProductInBuildWidget(product: pcBuildViewModel.pcBuild?.motherboard, category: CategoryTitles.mbTitle, onTapDelete: _handleRemoveProductClick)
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ProductInBuildWidget(product: pcBuildViewModel.pcBuild?.graphicsCard, category: CategoryTitles.gpuTitle, onTapDelete: _handleRemoveProductClick)
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ProductInBuildWidget(product: pcBuildViewModel.pcBuild?.powerSupply, category: CategoryTitles.psuTitle, onTapDelete: _handleRemoveProductClick)
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: ProductInBuildWidget(product: pcBuildViewModel.pcBuild?.pcCase, category: CategoryTitles.caseTitle, onTapDelete: _handleRemoveProductClick)
        ),
        // todo: implement render logic for ram and storage devices
      ]),
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
        // The title text which will be shown on the action bar
        title: const Text(PcBuilderScreen.title));
  }
}
