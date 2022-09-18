import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:match/View/today_match.dart';
import 'package:match/View/tomorrow_match.dart';
import 'package:match/View/yesterday_match.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ActivePage = 1;
  List Pages = [
    {'page': const YesterdayMatch(), 'title': 'مباريات أمس'},
    {'page': const TodayMatch(), 'title': 'مباريات اليوم'},
    {'page': const TomorrowMatch(), 'title': 'مباريات الغد'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Tajawal'),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(Pages[ActivePage]['title']),
            centerTitle: true,
          ),
          body: Pages[ActivePage]['page'],
          bottomNavigationBar: ConvexAppBar(
            items: const [
              TabItem(icon: Icons.sports_soccer, title: 'مباريات أمس'),
              TabItem(icon: Icons.sports, title: 'مباريات اليوم'),
              TabItem(
                  icon: Icons.sports_volleyball_sharp, title: 'مباريات الغد'),
            ],
            initialActiveIndex: ActivePage,
            onTap: (int index) {
              setState(() {
                ActivePage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
