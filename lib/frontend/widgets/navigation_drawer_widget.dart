import 'package:flutter/material.dart';

import 'package:pc_builder_mk_mobile/frontend/views/pc_builder_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/select_product_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/login_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/register_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/profile_view.dart';
import 'package:pc_builder_mk_mobile/service/auth_service.dart';

import '../views/qr_code_login_view.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      )));

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
              leading: const Icon(Icons.plus_one_outlined),
              title: const Text(SelectProductScreen.title),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, SelectProductScreen.routeName);
              }),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.computer_outlined),
              title: const Text(PcBuilderScreen.title),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PcBuilderScreen.routeName);
              }),
          const Divider(color: Colors.black54),
          ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text(ProfileScreen.title),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, ProfileScreen.routeName);
              }),
          if (AuthService.instance.userIsLoggedIn()) const Divider(color: Colors.black54),
          if (AuthService.instance.userIsLoggedIn())
            ListTile(
                leading: const Icon(Icons.login),
                title: const Text(QrCodeLoginView.title),
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, QrCodeLoginView.routeName);
                }),
          const Divider(color: Colors.black54),
          if (!AuthService.instance.userIsLoggedIn())
            ListTile(
                leading: const Icon(Icons.login),
                title: const Text(RegisterScreen.title),
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
                }),
          !AuthService.instance.userIsLoggedIn()
              ? ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text(LoginScreen.title),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  })
              : ListTile(
                  leading: const Icon(Icons.home_outlined),
                  title: const Text('Logout'),
                  onTap: () async {
                    await AuthService.instance.logout();
                    Navigator.pushReplacementNamed(
                        context, PcBuilderScreen.routeName);
                  })
        ],
      ));
}
