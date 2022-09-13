// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'package:application_project/pages/bottomNavigation/aboutnav.dart';
import 'package:application_project/pages/bottomNavigation/profilenav.dart';
import 'package:application_project/pages/bottomNavigation/videosnav.dart';
import 'package:application_project/registration_pages/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late SharedPreferences logindata;
  String finalName = "";
  String finalEmail = "";
  int _selectedIndex = 0;
  static const List<Widget> _bodyView = <Widget>[
    ProfilePage(),
    AboutPage(),
    VideosPage(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    getValidationData();
  }

  Widget _tabItem(Widget child, String label, {bool isSelected = false}) {
    return AnimatedContainer(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple,
              ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            child,
            Text(label, style: const TextStyle(fontSize: 8)),
          ],
        ));
  }

  final List<String> _labels = ['Profile', 'About', 'Videos'];

  @override
  Widget build(BuildContext context) {
    List<Widget> _icons = const [
      Icon(Icons.person),
      Icon(Icons.book),
      Icon(Icons.video_label)
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 30.0,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        scrolledUnderElevation: 30.0,
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            'Dashboard',
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 30.0,
        child: Material(
          color: Colors.purple,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: [
              Container(
                height: 150,
                width: double.maxFinite,
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
                child: Divider(
                  thickness: 2.0,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70, left: 10),
                child: Column(
                  children: [
                    ListTile(
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 40,
                      ),
                      iconColor: Colors.white,
                      title: const Text(
                        ' My Profile ',
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
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.book,
                        size: 40,
                      ),
                      iconColor: Colors.white,
                      title: const Text(
                        ' About Company ',
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
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.workspace_premium,
                        size: 40,
                      ),
                      iconColor: Colors.white,
                      title: const Text(
                        ' Go Premium ',
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
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.white),
                      ),
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
                    ListTile(
                      tileColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: const BorderSide(color: Colors.white),
                      ),
                      leading: const Icon(
                        Icons.edit,
                        size: 40,
                      ),
                      iconColor: Colors.white,
                      title: const Text(
                        ' Edit Profile ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 85),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: const BorderSide(color: Colors.orange),
                        ),
                        leading: const Icon(
                          Icons.logout,
                          size: 40,
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
                                  builder: (context) =>
                                      const RegistrationPage()),
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
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _bodyView.elementAt(_selectedIndex),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: Colors.purple.withOpacity(0.1),
            child: TabBar(
                onTap: (x) {
                  setState(() {
                    _selectedIndex = x;
                  });
                },
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  for (int i = 0; i < _icons.length; i++)
                    _tabItem(
                      _icons[i],
                      _labels[i],
                      isSelected: i == _selectedIndex,
                    ),
                ],
                controller: _tabController),
          ),
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
