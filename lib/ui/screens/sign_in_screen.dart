import 'package:flutter/material.dart';
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
            const SizedBox(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_circle_right_outlined),
            ),
            const SizedBox(height: 24),
           Center(
             child: Column(
             
               children: [
                 TextButton(
                   onPressed: () {},
                   child: Text("Forgot Password",style:TextStyle(color: Colors.grey),),
                 ),
                 RichText(
                   text: TextSpan(
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.w600,
                           fontSize: 14,
                           letterSpacing: 0.5),
                       text: "Don't Have an account?  ",
                       children: [
                         TextSpan(
                             text: "sign Up",
                             style: TextStyle(color: AppColors.themeColor))
                       ]),
                 )
               ],
             ),
           )
          ],
        ),
      )),
    );
  }
}
