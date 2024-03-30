import 'package:flutter/material.dart';
import 'package:lla/core/theme/app_pallete.dart';
import 'package:lla/features/auth/presentation/pages/signup_page.dart';
import 'package:lla/features/auth/presentation/widgets/auth_field.dart';
import 'package:lla/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:lla/services/auth_services.dart';

class SignInPage extends StatefulWidget {

  static route() => MaterialPageRoute(
                      builder: (context) =>  const SignInPage(),
                    );

  const SignInPage({super.key});

 

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

   void signInUser(){
    if(formkey.currentState!.validate()){
      AuthService().signInUser(
        context: context,
        email: emailController.text,
        password: pwdController.text
      );
    }
  }

  @override
  void dispose(){
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.textColor
                ),
                
              ),
              const SizedBox(height: 30,),
              AuthField(hintText: 'Email', controller: emailController,),
              const SizedBox(height: 15,),
              AuthField(hintText: 'Password', controller: pwdController, isHidden: true,),
              const SizedBox(height: 15,),
              AuthGradientButton(buttonText: 'Sign In', someFn: signInUser,),
              const SizedBox(height: 15),
              GestureDetector(
                
                onTap: () {
                  Navigator.push(
                    context, 
                    SignUpPage.route()
                    
                  );
                },

                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                      color: AppPallete.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPallete.primaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                  )
                  
                 ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}