import 'package:pokedex/features/auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'BIKESHARED',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Icon(
                  Icons.directions_bike,
                  size: 100,
                ),
                SizedBox(height: 20),
                AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
