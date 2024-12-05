import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.arabicName,
    required this.enName,
    required this.nummber,
    required this.type,
  });

  final int nummber;
  final String arabicName;
  final String enName;
  final String type;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth * 0.06;
    double subtitleFontSize = screenWidth * 0.05; 
    double numberFontSize = screenWidth * 0.04; 

   

    return ListTile(
      
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          child: Text(
            nummber.toString(),
            style: TextStyle(
              fontSize: numberFontSize,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
      title: Text(
        enName,
        style: TextStyle(
          fontSize: titleFontSize,
        ),
      ),
      subtitle: Text(
        type,
        style: TextStyle(
          fontSize: subtitleFontSize,
          color: Colors.black,
        ),
      ),
      trailing: Text(
        arabicName,
        style: TextStyle(
          fontSize: titleFontSize,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
