// import 'package:pokedex/common/routes/routes.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BIKESHARED',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/system/bike5.png',
                height: size.height * .3,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushReplacementNamed(Routes.authOrHome);
                },
                child: const Text('ENTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
