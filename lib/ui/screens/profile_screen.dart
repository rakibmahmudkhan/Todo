import 'package:flutter/material.dart';

import '../widgets/tm_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(
        isProfileScreenOpen: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              Text("Update Profile",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 16,
              ),
              _buildphotoPicker(),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Phone"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_circle_right_outlined)),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildphotoPicker(){
    return Container(
      height: 55,
      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(children: [
        Container(
          width: 100,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(

                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
            )

           ),
          alignment: Alignment.center,
          child: Text("Photo",style: TextStyle(fontSize: 16,fontWeight:FontWeight.w600 ),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Selected Photo"),
        )
      ],),
    );
  }
}
