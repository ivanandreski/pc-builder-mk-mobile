import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  static const title = 'Register'; // TODO: replace this with the name of the product

  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {

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
        const Text(RegisterScreen.title)
    );
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(RegisterScreen.title),
    );
  }
}