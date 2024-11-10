import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/screens/forgot_password_otp_screen.dart';
import 'package:todo/ui/utils/app_color.dart';
import 'package:todo/ui/widgets/screen_background.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
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
            Text("Your Email Address",
                style: textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 8,
            ),
            Text("A 6 digit verification otp will be sent to your email address ",
                style: textTheme.titleSmall
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(
              height: 24,
            ),
            _buildVerifyEmailForm(),
            const SizedBox(height: 48),
            Center(
              child: _haveAccountSection(),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildVerifyEmailForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Email"),
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
Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordOtpScreen()));
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
}
