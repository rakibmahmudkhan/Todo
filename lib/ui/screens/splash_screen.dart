import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/ui/screens/sign_in_screen.dart';

import '../utils/assets_path.dart';
import '../widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();

  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsPath.imagePath,
                width: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
