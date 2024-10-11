import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            AssetsPath.backGroundImagePath,
            fit: BoxFit.cover,
            height: screenSize.height * 1,
            width: screenSize.width * 1,
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
