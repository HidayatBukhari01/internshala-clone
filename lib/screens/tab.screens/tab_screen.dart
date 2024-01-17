import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_clone/screens/tab.screens/clubs.screens/clubs_screen.dart';
import 'package:internshala_clone/screens/tab.screens/courses.screens/courses_screen.dart';
import 'package:internshala_clone/screens/tab.screens/home.screen/home_screen.dart';
import 'package:internshala_clone/screens/tab.screens/internships.screen/internships_screen.dart';
import 'package:internshala_clone/screens/tab.screens/jobs.screen/jobs_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const HomeScreen(),
    const InternshipsScreen(),
    const JobsScreen(),
    const ClubsScreen(),
    const CoursesScreen()
  ];
  List<String> titles = ["Home ", "Internships", "Jobs", "Clubs", "Courses"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: const Icon(Icons.menu),
        title: Text(
          titles[_currentIndex],
          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            iconSize: 24,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
          IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.message,
                size: 18,
              )),
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.paperPlane,
              ),
              label: 'Internships',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outlined),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_rounded),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video_outlined),
              label: 'Courses',
            ),
          ]),
    );
  }
}
