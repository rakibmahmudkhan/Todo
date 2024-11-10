import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/ui/screens/forgot_password_email_screen.dart';
import 'package:todo/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:todo/ui/screens/sign_up_screen.dart';
import 'package:todo/ui/utils/app_color.dart';
import 'package:todo/ui/widgets/screen_background.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 82,
            ),
            Text("Get Started With",
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 24,
            ),
            _buildSignInForm(),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                    TextButton(
                    onPressed: _onTapForgotPasswordButton,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  _buildSignUpSection()
                ],
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Email"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }
  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.5),
          text: "Don't Have an account?  ",
          children: [
            TextSpan(
                text: "Sign Up",
                style: const TextStyle(color: AppColors.themeColor),
                recognizer: TapGestureRecognizer()..onTap = _onTapSignUp)
          ]),
    );
  }



  void _onTapNextButton() {
Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainBottomNavBarScreen()), (value)=> false);
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ForgotPasswordEmailScreen()));
  }

  void _onTapSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }

}