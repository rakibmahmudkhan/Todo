import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/screens/forgot_password_otp_screen.dart';
import 'package:todo/ui/screens/sign_in_screen.dart';
import 'package:todo/ui/utils/app_color.dart';
import 'package:todo/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
            Text("Set Password",
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 8,
            ),
            Text("Minimum length password 8 character with Latter and number combination",
                style: textTheme.titleSmall
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(
              height: 24,
            ),
            _buildPasswordResetForm(),
            const SizedBox(height: 48),
            Center(
              child: _haveAccountSection(),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildPasswordResetForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ), TextFormField(
          decoration: const InputDecoration(hintText: "Confirm Password"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _onTapNextButton,
          child: Icon(Icons.arrow_circle_right_outlined),
        ),
      ],
    );
  }

  Widget _haveAccountSection() {
    return RichText(
      text: TextSpan(
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.5),
          text: "Have account?  ",
          children: [
            TextSpan(
                text: "sign In",
                style: const TextStyle(color: AppColors.themeColor),
                recognizer: TapGestureRecognizer()..onTap = _onTapSignIn)
          ]),
    );
  }

  void _onTapNextButton() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SignInScreen()), (_)=>false);
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const SignInScreen()), (_)=>false);

  }
}
