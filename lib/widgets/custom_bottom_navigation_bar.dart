import 'package:alquran/screens/audiopage.dart';
import 'package:alquran/screens/azkar.dart';
import 'package:alquran/screens/azkar_contetnt.dart';
import 'package:alquran/screens/content.dart';
import 'package:alquran/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double iconSize = screenWidth * 0.08;
    double fontSize = screenWidth * 0.04; 

    return BottomNavigationBar(
      onTap: (value) {
        index = value;
        setState(() {});

        if (index == 2) {
          Navigator.pushNamed(context, AudioHome.id);
        } else if (index == 0) {
          Navigator.pushNamed(context, Content.id);
        } else if (index == 3) {
          Navigator.pushNamed(context, SettingPage.id);
        } else if (index == 1) {
          Navigator.pushNamed(context, Al_Azkar.id);
        }
      },
      currentIndex: index,
      elevation: 0,
      backgroundColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 74, 109, 137),
      unselectedItemColor: Colors.black.withOpacity(0.6),
      unselectedLabelStyle: TextStyle(fontSize: fontSize),
      selectedLabelStyle: TextStyle(fontSize: fontSize),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: iconSize,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
FontAwesomeIcons.moon            ,
            size: iconSize,
          ),
          label: 'Al_Azkar',
        ),
       
        BottomNavigationBarItem(
          icon: Icon(
            Icons.music_note,
            size: iconSize,
          ),
          label: 'Audio',
        ),
       
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: iconSize,
          ),
          label: 'Setting',
        ),
        
      ],
    );
  }
}