import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/data/models/network_response.dart';
import 'package:todo/data/services/network_caller.dart';
import 'package:todo/ui/controller/auth_controller.dart';
import 'package:todo/ui/screens/forgot_password_email_screen.dart';
import 'package:todo/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:todo/ui/screens/sign_up_screen.dart';
import 'package:todo/ui/utils/app_color.dart';
import 'package:todo/ui/widgets/screen_background.dart';
import 'package:todo/ui/widgets/snack_bar_message.dart';

import '../../data/utils/urls.dart';
import '../widgets/centered_circular_progress_indicator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordTEController,
            obscureText: false,
            decoration: const InputDecoration(hintText: 'Password'),
            validator: (String? value) {
              if (value?.isEmpty ?? true) {
                return 'Enter a your password';
              }
              if (value!.length <= 5) {
                return 'Enter a password more than 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          Visibility(
            visible: !_inProgress,
            replacement: const CenteredCircularProgressIndicator(),
            child: ElevatedButton(
              onPressed: _onTapNextButton,
              child: const Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
        ],
      ),
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
    if (_formKey.currentState!.validate()) {
      _onSignIn();
    }
    return;
  }

  Future<void> _onSignIn() async {
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      'email': "${_emailTEController.text.trim()}",
      'password': "${_passwordTEController.text}"
    };
    print("RMK");
    final NetworkResponse response = await NetworkCaller.postRequest(
        url: "${Urls.logIn}", body: requestBody);

    _inProgress = false;
    setState(() {});
    if (response.isSuccess) {
      await AuthController.saveAccessToken(response.responseData['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainBottomNavBarScreen()),
          (value) => false);
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const ForgotPasswordEmailScreen()));
  }

  void _onTapSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
  }
}
