import 'dart:convert';
import 'package:alquran/screens/azkar_contetnt.dart';
import 'package:flutter/material.dart';

class Al_Azkar extends StatelessWidget {
  const Al_Azkar({super.key});
  static String id = "azkar";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Al_Azkar"),
        backgroundColor: Color(0xfff0ede8),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 35),
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
                List azkarData = json.decode(snapshot.data!);

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return ListView.builder(
                      itemCount: azkarData.length,
                      itemBuilder: (context, index) {
                        var azkar = azkarData[index];

                        double fontSize = screenSize.width > 600 ? 29 : 22;

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Azkar_Content.id);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  azkar['id'].toString(),
                                  style: TextStyle(fontSize: 23, color: Colors.white,),
                                ),
                                backgroundColor: Colors.black,
                                
                              ),
                              trailing: Text(
                                azkar['name'],
                                style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),
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
