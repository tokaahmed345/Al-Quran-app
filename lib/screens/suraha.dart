import 'package:alquran/models/suraha.dart';
import 'package:flutter/material.dart';

class SurhaText extends StatelessWidget {
  const SurhaText({super.key});
  static String id = "Suraha";

  @override
  Widget build(BuildContext context) {
    final Surahs dataSurah = ModalRoute.of(context)!.settings.arguments as Surahs;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff0ede8),
        elevation: 0,
        title: Text(
          dataSurah.name ?? " ",
          style: TextStyle(
            fontSize: screenWidth * 0.07,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenWidth * 0.08,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/back.jpg")),
          ListView.builder(
            itemCount: dataSurah.ayahs!.length, 
            itemBuilder: (context, index) {
              final aya = dataSurah.ayahs![index]; 
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${aya.text} (${aya.numberInSurah})", 
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
