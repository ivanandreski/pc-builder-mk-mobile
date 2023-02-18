import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/domain/view_models/pc_build_view_model.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/summary_widget.dart';

class PcBuilderScreen extends StatefulWidget {
  static const routeName = '/pc-builder-screen';
  static const title = 'PC Build';

  const PcBuilderScreen({super.key});

  @override
  State<StatefulWidget> createState() => PcBuilderScreenState();
}

class PcBuilderScreenState extends State<PcBuilderScreen> {
  final PcBuildViewModel pcBuildViewModel = PcBuildViewModel();

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
    return (Container(
      child: SummaryWidget(price: 30000, compatible: true),
      // foreach product in pc build
    ));
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
        // The title text which will be shown on the action bar
        title: const Text(PcBuilderScreen.title));
  }
}
