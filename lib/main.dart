import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pc_builder_mk_mobile/domain/view_models/pc_build_view_model.dart';
import 'package:pc_builder_mk_mobile/domain/view_models/products_view_model.dart';
import 'package:pc_builder_mk_mobile/frontend/views/qr_code_login_view.dart';
import 'package:provider/provider.dart';

import 'package:pc_builder_mk_mobile/frontend/views/login_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/register_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/profile_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/pc_builder_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/select_product_view.dart';
import 'package:pc_builder_mk_mobile/frontend/views/product_details_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox('localstorage');

  // box.clear();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => PcBuildViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
        initialRoute: PcBuilderScreen.routeName,
        routes: {
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          RegisterScreen.routeName: (ctx) => const RegisterScreen(),
          QrCodeLoginView.routeName: (ctx) => const QrCodeLoginView(),
          ProfileScreen.routeName: (ctx) => const ProfileScreen(),
          PcBuilderScreen.routeName: (ctx) => const PcBuilderScreen(),
          SelectProductScreen.routeName: (ctx) => const SelectProductScreen(),
          ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
        });
  }
}
