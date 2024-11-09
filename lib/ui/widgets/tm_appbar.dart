import 'package:flutter/material.dart';
import 'package:todo/ui/screens/sign_in_screen.dart';

import '../utils/app_color.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            width: 26,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  "User@gmail.com",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                        (value) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
