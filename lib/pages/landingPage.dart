// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'package:application_project/pages/bottomNavigation/aboutnav.dart';
import 'package:application_project/pages/bottomNavigation/profilenav.dart';
import 'package:application_project/pages/bottomNavigation/videosnav.dart';
import 'package:application_project/pages/drawer%20pages/drawerhome.dart';
import 'package:application_project/widgets/appbar.dart';
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
        elevation: 30,
        title: Center(child: const AppBarPage()),
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const Drawer(
        child: DrawerHomePage(),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
