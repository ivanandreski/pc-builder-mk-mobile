import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pc_builder_mk_mobile/frontend/views/pc_builder_view.dart';

import 'package:pc_builder_mk_mobile/frontend/widgets/navigation_drawer_widget.dart' as custom_nav_drawer;
import 'package:pc_builder_mk_mobile/service/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  static const title = 'Register';

  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String errorMessage = "";

  void _submit() async {
    setState(() {
      errorMessage = "";
    });
    if (registerFormKey.currentState!.validate()) {
      final authService = AuthService.instance;
      final loginResponse = await authService.register(email, password);
      if (loginResponse.success) {
        Navigator.pushReplacementNamed(context, PcBuilderScreen.routeName);
      } else {
        setState(() {
          errorMessage = loginResponse.message;
        });
      }
    }
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
    return Container(
        padding: const EdgeInsets.all(8),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: registerFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                if (errorMessage.isNotEmpty)
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
                    if (!EmailValidator.validate(value)) {
                      return 'Invalid email';
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
                    if (value.length < 7) {
                      return 'Enter min. 7 characters';
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
                      child: const Text("Register")),
                ),
              ],
            )));
  }

  Widget _createAppBar(BuildContext context) {
    return AppBar(
      // The title text which will be shown on the action bar
      title: const Text("Register"),
    );
  }
}
