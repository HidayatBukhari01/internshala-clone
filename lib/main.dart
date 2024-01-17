import 'package:flutter/material.dart';
import 'package:internshala_clone/routes/routes.dart';
import 'package:internshala_clone/screens/tab.screens/internships.screen/internships_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InternshipsViewModel>(create: (_) => InternshipsViewModel())
      ],
      child: MaterialApp(
        title: 'Internshala Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff006BC2)),
          useMaterial3: true,
        ),
        routes: Routes().routes,
      ),
    );
  }
}
