import 'package:pokedex/features/auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/images/ball.png',
                  height: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  'POKEDEX',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
