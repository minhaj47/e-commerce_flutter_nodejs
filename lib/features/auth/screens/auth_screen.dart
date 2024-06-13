import 'package:ecommerce_app_flutter_nodejs/common/widget/custom_button.dart';
import 'package:ecommerce_app_flutter_nodejs/common/widget/custom_textfield.dart';
import 'package:ecommerce_app_flutter_nodejs/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;

  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthServices authServices = AuthServices();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUp() {
    authServices.signUpUser(
      context: context,
      email: _emailController.text,
      name: _nameController.text,
      password: _passwordController.text,
    );
  }

  void signIn() {
    authServices.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Welcome",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 30.0,
              ),
              ListTile(
                title: Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                leading: Radio(
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Log In",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                leading: Radio(
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Form(
                  key: _signUpKey,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _nameController,
                          hintText: 'Enter your name',
                        ),
                        CustomTextfield(
                          controller: _emailController,
                          hintText: 'Enter your email',
                        ),
                        CustomTextfield(
                          controller: _passwordController,
                          hintText: 'Enter a password',
                        ),
                        CustomButton(
                          lebel: 'Create Account',
                          onTap: () {
                            if (_signUpKey.currentState!.validate()) {
                              signUp();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              if (_auth == Auth.signIn)
                Form(
                  key: _signInKey,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _emailController,
                          hintText: 'Enter your Email',
                        ),
                        CustomTextfield(
                          controller: _passwordController,
                          hintText: 'Enter a password',
                        ),
                        CustomButton(
                          lebel: 'Log In',
                          onTap: () {
                            if (_signInKey.currentState!.validate()) {
                              signIn();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
