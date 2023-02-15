import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pc_builder_mk_mobile/service/auth_service.dart';

import 'package:pc_builder_mk_mobile/frontend/screens/pc_builder_screen.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  static const title = 'Login';

  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = "";

  void _submit() {
    final authService = AuthService.instance;
    final loginResponse = authService.login(email, password);
    if (loginResponse.success) {
      Navigator.pushReplacementNamed(context, PcBuilderScreen.routeName);
    }

    setState(() => {errorMessage = "Invalid credentials"});
  }

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
    return Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: loginFormKey,
          child: Column(
            children: [
              if (errorMessage.isNotEmpty)
                const SizedBox(
                  height: 16,
                ),
              Text(
                errorMessage,
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email field is required';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[ ]')),
                ],
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password field is required';
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[ ]')),
                ],
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48)),
                    onPressed: () => _submit(),
                    child: const Text("Login")),
              ),
            ],
          ),
        ));
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text(LoginScreen.title),
    );
  }
}