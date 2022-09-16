// ignore_for_file: sized_box_for_whitespace

import 'package:application_project/pages/drawer%20pages/profileedit.dart';
import 'package:application_project/registration_pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerHomePage extends StatefulWidget {
  const DrawerHomePage({super.key});

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  late SharedPreferences logindata;
  String finalName = "";
  String finalEmail = "";
  @override
  void initState() {
    super.initState();
    getValidationData();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30.0,
      child: Material(
        color: Colors.purple,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/login_image.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$finalName',
                            style: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '$finalEmail',
                            style: const TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.all(8),
              child: Divider(
                thickness: 2.0,
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    subtitle: const Text(
                      ' Profile Editing ',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontSize: 8,
                      ),
                    ),
                    tileColor: Colors.purple,
                    leading: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    iconColor: Colors.white,
                    title: const Text(
                      ' My Profile ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileEditPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.purple,
                    leading: const Icon(
                      Icons.book,
                      size: 40,
                    ),
                    iconColor: Colors.white,
                    title: const Text(
                      ' About Company ',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      ' Fin infocom ',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontSize: 8,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.purple,
                    leading: const Icon(
                      Icons.workspace_premium,
                      size: 40,
                    ),
                    subtitle: const Text(
                      ' Premium Membership',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontSize: 8,
                      ),
                    ),
                    iconColor: Colors.white,
                    title: const Text(
                      'Premium ',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    subtitle: const Text(
                      ' Videos Saved ',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        fontSize: 8,
                      ),
                    ),
                    tileColor: Colors.purple,
                    leading: const Icon(
                      Icons.video_label,
                      size: 40,
                    ),
                    iconColor: Colors.white,
                    title: const Text(
                      ' Saved Videos ',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 75),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.orange),
                      ),
                      leading: const Icon(
                        Icons.logout,
                        size: 30,
                      ),
                      iconColor: Colors.purple,
                      title: const Text(
                        'LogOut',
                        style: TextStyle(color: Colors.purple),
                      ),
                      onTap: () async {
                        logindata.setBool('login', true);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()),
                            (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getValidationData() async {
    logindata = await SharedPreferences.getInstance();

    setState(() {
      finalEmail = logindata.getString('email')!;
      finalName = logindata.getString('name')!;
    });
  }
}
