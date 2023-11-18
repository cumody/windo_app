import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windo_app/controllers/auth_controller.dart';
import 'package:windo_app/services/auth.dart';
import 'package:windo_app/utilities/enums.dart';
import 'package:windo_app/utilities/routes.dart';
import 'package:windo_app/views/widgets/main_buttons.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusedNode = FocusNode();
  final _passwordFocusedNode = FocusNode();

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.bottomNavBar);
    } catch (e) {
      // We Will Refactor This code into another widget
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content:
              Text(e.toString(), style: Theme.of(context).textTheme.bodyMedium),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, model, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 60.0,
                horizontal: 32.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.authFormType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 80.0),
                    TextFormField(
                      onChanged: model.updateEmail,
                      controller: _emailController,
                      focusNode: _emailFocusedNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusedNode),
                      textInputAction: TextInputAction.next,
                      validator: (val) =>
                          val!.isEmpty ? 'Please enter your email!' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email!',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      onChanged: model.updatePassword,
                      obscureText: true,
                      focusNode: _passwordFocusedNode,
                      controller: _passwordController,
                      validator: (val) =>
                          val!.isEmpty ? 'Please enter your password!' : null,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your pasword!',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    if (model.authFormType == AuthFormType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: const Text('Forgot your password?'),
                          onTap: () {},
                        ),
                      ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MainButton(
                        text: model.authFormType == AuthFormType.login
                            ? 'Login'
                            : 'Register',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _submit(model);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'Don\'t have an account? Register'
                              : 'Have an account? Login',
                        ),
                        onTap: () {
                          model.toggleFormType();
                        },
                      ),
                    ),
                    const Spacer(),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'Or Login with'
                              : 'Or Register with',
                          style: Theme.of(context).textTheme.titleMedium,
                        )),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 16.0),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
