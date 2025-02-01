import 'package:do_it/common_widgets/bottom_nav_bar.dart';
import 'package:do_it/common_widgets/navigateToPage.dart';
import 'package:do_it/pages/about.dart';
import 'package:do_it/pages/projects.dart';
import 'package:do_it/pages/to_do.dart';
import 'package:do_it/utils/ui.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List<Widget> myPages = [const ToDo(), const Projects()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: pink),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
              "assets/images/do_it_logo.png",
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Do-it ♡",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  navigateToPage(context, const About());
                },
                child: const ListTile(
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 20, color: black),
                  ),
                  leading:
                      Icon(Icons.account_circle_rounded, color: black),
                ),
              ),
            )
          ],
        ),
      ),
      body: myPages[index],
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigation(index)),
    );
  }

  navigation(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }
}
