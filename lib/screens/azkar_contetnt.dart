import 'package:flutter/material.dart';

class Azkar_Content extends StatelessWidget {
  const Azkar_Content({super.key});
static String id="Azkar_Content";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("اذكار الصاح "),
        backgroundColor: Color(0xfff0ede8),
        centerTitle: true,
        leading: IconButton(
         icon: Icon(Icons.arrow_back_ios,size: 35,),

onPressed: 
(){
  Navigator.pop(context);
},
        ),
      ),
      
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/back.jpg")),
        ]
      
      )
    );
      
  }
}