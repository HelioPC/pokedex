import 'package:pokedex/features/auth/services/auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  AuthMode authMode = AuthMode.signup;
  AnimationController? _animationController;
  bool isLoading = false;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Autenticação falhou'),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    setState(() => isLoading = true);

    _formKey.currentState?.save();

    Auth auth = Provider.of<Auth>(context, listen: false);

    try {
      if (_isLogin()) {
        await auth.signIn(_authData['email']!, _authData['password']!);
      } else {
        await auth.signup(_authData['email']!, _authData['password']!);
      }
    } on Exception catch (e) {
      _showErrorDialog(e.toString());
    } catch (e) {
      _showErrorDialog('Unexpected error');
    }

    setState(() => isLoading = false);
  }

  void _switchMode() {
    setState(() {
      if (_isLogin()) {
        authMode = AuthMode.signup;
        _animationController?.forward();
      } else {
        authMode = AuthMode.login;
        _animationController?.reverse();
      }
      _formKey.currentState?.reset();
    });
  }

  bool _isLogin() => authMode == AuthMode.login;
  bool _isSignup() => authMode == AuthMode.signup;

  @override
  void dispose() {
    passwordController.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: _isLogin() ? 370 : 440,
      width: deviceSize.width * 0.75,
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              enabled: !isLoading,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'E-mail',
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _authData['email'] = value,
              validator: (value) {
                final email = value ?? '';
                if (email.trim().isEmpty || !email.contains('@')) {
                  return 'Invalid e-mail address';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              enabled: !isLoading,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_open),
                labelText: 'Senha',
                hintText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: passwordController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) => _authData['password'] = value,
              validator: (value) {
                final password = value ?? '';
                if (password.isEmpty ||
                    password.length < 5 ||
                    password.length > 16) {
                  return 'Password must have 6-16 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            if (_isSignup())
              Column(
                children: [
                  TextFormField(
                    enabled: !isLoading,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Confirme a senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: _isLogin()
                        ? null
                        : (value) {
                            final password = value ?? '';
                            if (password != passwordController.text) {
                              return 'Passwords don\'t match';
                            }

                            return null;
                          },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            Visibility(
              visible: !isLoading,
              replacement: const CircularProgressIndicator(),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  child:
                      Text(authMode == AuthMode.login ? 'Entrar' : 'Submeter'),
                ),
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: _isLogin()
                    ? 'Não possui uma conta? '
                    : 'Já possui uma conta? ',
                //style: TextStyle(color: context.theme.textColor),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = _switchMode,
                    text: _isLogin() ? 'Cadastre-se' : 'Entre',
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
