import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/ui/controller/auth_controller.dart';
import 'package:todo/ui/screens/main_bottom_nav_bar_screen.dart';
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
     super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getAccessToken();
    if (AuthController.isLoggedIn()) {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const MainBottomNavBarScreen();
      }));
    } else {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SignInScreen();
      }));
    }

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
