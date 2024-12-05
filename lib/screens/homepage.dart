import 'package:alquran/screens/content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, Content.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double imageWidth = screenWidth;
    double imageHeight = screenHeight;

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/quranphoto.png",
          fit: BoxFit.cover, 
          width: imageWidth,  
          height: imageHeight, 
        ),
      ),
    );
  }
}
