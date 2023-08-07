import 'package:pokedex/features/auth/pages/auth_page.dart';
import 'package:pokedex/features/auth/services/auth.dart';
import 'package:pokedex/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatefulWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  State<AuthOrHomePage> createState() => _AuthOrHomePageState();
}

class _AuthOrHomePageState extends State<AuthOrHomePage> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return auth.isAuth ? const HomePage() : const AuthPage();
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Erro durante a autenticação'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text('Tentar novamente'),
                ),
              ],
            );
        }
      },
    );
  }
}
