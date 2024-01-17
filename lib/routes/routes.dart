import 'package:flutter/material.dart';
import 'package:internshala_clone/screens/tab.screens/clubs.screens/clubs_screen.dart';
import 'package:internshala_clone/screens/tab.screens/courses.screens/courses_screen.dart';
import 'package:internshala_clone/screens/tab.screens/internships.screen/internships_screen.dart';
import 'package:internshala_clone/screens/tab.screens/jobs.screen/jobs_screen.dart';
import 'package:internshala_clone/screens/tab.screens/tab_screen.dart';

import '../screens/splash_screen.dart';
import 'route_name.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> routes = {
    RouteName.splashRoute: (context) => const SplashScreen(),
    RouteName.homeScreenRoute: (context) => const TabScreen(),
    RouteName.internshpsScreenRoute: (context) => const InternshipsScreen(),
    RouteName.jobsScreenRoute: (context) => const JobsScreen(),
    RouteName.clubsScreenRoute: (context) => const ClubsScreen(),
    RouteName.coursesScreenRoute: (context) => const CoursesScreen(),
  };
}
