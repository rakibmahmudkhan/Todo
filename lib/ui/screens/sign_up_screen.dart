import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo/ui/utils/app_color.dart';
import 'package:todo/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                Text("Join With Us",
                    style: textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 24,
                ),
                _buildSignUpForm(),
                const SizedBox(height: 24),
                Center(
                  child: _haveAccountSection(),
                )
              ],
            ),
          )),
    );
  }
  Widget _buildSignUpForm() {

    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Email"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: 8,
        ),TextFormField(
          decoration: const InputDecoration(hintText: "First Name"),
        ),
        const SizedBox(
          height: 8,
        ),TextFormField(
          decoration: const InputDecoration(hintText: "Last Name"),
        ),
        const SizedBox(
          height: 8,
        ),TextFormField(
          decoration: const InputDecoration(hintText: "Mobile"),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
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
                text: "sign In", style: const TextStyle(color: AppColors.themeColor),
                recognizer: TapGestureRecognizer()..onTap=_onTapSignIn)
          ]),
    );
  }


  void _onTapNextButton(){
//TODO:implement on tap to te next Button
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
}



