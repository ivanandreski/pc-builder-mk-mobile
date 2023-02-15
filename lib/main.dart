import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pc_builder_mk_mobile/frontend/screens/login_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/screens/register_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/screens/profile_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/screens/pc_builder_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/screens/select_product_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/screens/product_details_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('localstorage');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Builder MK Mobile - MIS Homework 2',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
        initialRoute: SelectProductScreen.routeName, routes: {
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          RegisterScreen.routeName: (ctx) => const RegisterScreen(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
          PcBuilderScreen.routeName: (ctx) => const PcBuilderScreen(),
          SelectProductScreen.routeName: (ctx) => const SelectProductScreen(),
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
        });
  }
}