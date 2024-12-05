import 'package:alquran/widgets/custom_bottom_navigation_bar.dart';
import 'package:alquran/widgets/custom_grid.dart';
import 'package:alquran/widgets/listItem.dart';
import 'package:alquran/widgets/sajdalist.dart';
import 'package:flutter/material.dart';


class Content extends StatelessWidget {
  const Content({super.key});
  static String id = "content";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double appBarFontSize = screenWidth * 0.06;  
    double tabFontSize = screenWidth * 0.045;  

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff0ede8),
          elevation: 0,
          title: Text(
            "Al-Quran",
            style: TextStyle(
              color: Colors.black,
              fontSize: appBarFontSize,  
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/quran.png"),
          ),
          bottom: TabBar(
            indicatorColor: Colors.blue,
            indicatorWeight: 2.0,
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontSize: tabFontSize, fontWeight: FontWeight.bold),  
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Surah'),
              Tab(text: 'Sajda'),
              Tab(text: 'Juz'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/back.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            const TabBarView(
              children: [
                ListItem(),
                SajdaList(),
                CustomGrid(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
