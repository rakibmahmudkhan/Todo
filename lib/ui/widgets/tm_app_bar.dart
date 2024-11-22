import 'package:flutter/material.dart';
import 'package:todo/ui/controller/auth_controller.dart';
import 'package:todo/ui/screens/profile_screen.dart';
import 'package:todo/ui/screens/sign_in_screen.dart';

import '../utils/app_color.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key, this.isProfileScreenOpen= false
  });
final bool isProfileScreenOpen;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          GestureDetector(
            onTap: (){
             if(isProfileScreenOpen){
               return  ;
             } else{ Navigator.push(context, MaterialPageRoute(builder: (context){return ProfileScreen();}));}
            },
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
            ),
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
              onPressed: () async{
                await AuthController.clearUserData();
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
