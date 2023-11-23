import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(
              label: Text("Username")
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
                label: Text("Password")
            ),
          ),
        ],
      ),
    );
  }
}
