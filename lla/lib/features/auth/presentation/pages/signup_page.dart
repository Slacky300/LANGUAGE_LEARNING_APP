import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/features/auth/presentation/pages/signin_page.dart';
import 'package:lla/features/auth/presentation/widgets/auth_field.dart';
import 'package:lla/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:lla/services/auth_services.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final pwdController = TextEditingController();

  void signUpUser() {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Name is missing!'),
        backgroundColor: AppPallete.errorColor,
      ));
      return;
    }
    if (formkey.currentState!.validate()) {
      AuthService().signUpUser(
          context: context,
          username: nameController.text,
          email: emailController.text,
          password: pwdController.text);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up.',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.textColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthField(
                  hintText: 'Password',
                  controller: pwdController,
                  isHidden: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthGradientButton(
                  buttonText: 'Sign Up',
                  someFn: signUpUser,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignInPage.route());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                              color: AppPallete.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                          children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppPallete.primaryColor,
                                  fontWeight: FontWeight.bold),
                        )
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
