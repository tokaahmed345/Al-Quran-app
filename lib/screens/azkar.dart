import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:alquran/screens/azkar_contetnt.dart';

class Al_Azkar extends StatelessWidget {
  const Al_Azkar({super.key});
  static String id = "azkar";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double fontSize = screenSize.width > 600 ? 29 : 22; 

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Al_Azkar",
          style: TextStyle(fontSize: screenSize.width > 600 ? 30 : 20), 
        ),
        backgroundColor: Color(0xfff0ede8),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: screenSize.width > 600 ? 40 : 30), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/back.jpg")),
          FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/images/azkar.json"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );
              }

              if (snapshot.hasData) {
List sections = json.decode(snapshot.data!);
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      itemCount: sections.length,
                      itemBuilder: (context, index) {
                var section = sections[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenSize.width > 600 ? 20.0 : 16.0, 
                            horizontal: screenSize.width > 600 ? 40.0 : 16.0, 
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                              AzkarContent.id,
                                arguments: {
                            'name': section['name'],
                            'section_id': section['id']                             },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(screenSize.width > 600 ? 30.0 : 20.0), 
                              color: Color.fromARGB(255, 250, 239, 220),
                              child: Center(
                                child: Text(
                                  section['name'],
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
