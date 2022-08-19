import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/api_provider.dart';
import 'package:portfolio/tabs/about_tab.dart';
import 'package:portfolio/widgets/theme_inherited_widget.dart';
import 'package:provider/provider.dart';

import '../models/MessageModel.dart';
import '../providers/projectsprovider.dart';
import '../tabs/contact.dart';
import '../tabs/projects_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    int _selectedIndex =
        Provider.of<Navigations>(context).selectetab;
    List<Widget> tabWidgets = <Widget>[
      const AboutTab(),
      const ProjectsTab(),
       const ContactTab(),
      const AboutTab(),
    ];

    return Scaffold(
      key: _scaffold ,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
          Row(
            children: [
              const Expanded(child: SizedBox()),
              IconButton(
                icon: ThemeSwitcher.of(context).isDarkModeOn
                    ? Image.asset('assets/light.png')
                    : Image.asset('assets/moon.png'),
                onPressed: () => ThemeSwitcher.of(context)
                    .switchDarkMode(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const NavigationTabs(),
          tabWidgets.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationTabs extends StatefulWidget {
  const NavigationTabs({
    Key? key,
  }) : super(key: key);
  @override
  _NavigationTabsState createState() =>
      _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  @override
  Widget build(BuildContext context) {
    final selected =
        Provider.of<Navigations>(context).selected;
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          TabItem(
            text: 'ABOUT',
            active: selected[0],
            touched: () {
              setState(() {
                Provider.of<Navigations>(context,
                        listen: false)
                    .select(0);
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'PROJECTS',
            active: selected[1],
            touched: () {
              setState(() {
                Provider.of<Navigations>(context,
                        listen: false)
                    .select(1);
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
          TabItem(
            text: 'CONTACT',
            active: selected[2],
            touched: () {
              setState(() {
                Provider.of<Navigations>(context,
                        listen: false)
                    .select(2);
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  final Function touched;

  final bool active;
  final String text;
  const TabItem({
    Key? key,
    required this.touched,
    required this.active,
    required this.text,
  }) : super(key: key);
  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          widget.touched();
        },
        child: Row(
          children: [
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      widget.text,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: AnimatedContainer(
                      transform:
                          Matrix4.rotationZ(0.0174444),
                      duration:
                          const Duration(milliseconds: 300),
                      height: 70.0,
                      width: 2.0,
                      decoration: BoxDecoration(
                        color: widget.active
                            ? Theme.of(context).cardColor
                            : Colors.transparent,
                        
                      ),
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
}
