import 'package:flutter/material.dart';

class CustomFirstCard extends StatelessWidget {
  final String surName;
  final int surAya;

  const CustomFirstCard({
    super.key,
    required this.surName,
    required this.surAya,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.05), 
      ),
      elevation: 5,
      color: const Color(0xfffa1ced6),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              surName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.08, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Aya: ",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$surAya",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), 
          ],
        ),
      ),
    );
  }
}
