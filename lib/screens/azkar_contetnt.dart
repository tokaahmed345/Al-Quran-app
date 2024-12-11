import 'dart:convert';
import 'package:flutter/material.dart';

class AzkarContent extends StatelessWidget {
  const AzkarContent({super.key});
  static String id = "AzkarContent";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final azkarName = args['name'];
    final azkarId = args['section_id']; 

    var screenSize = MediaQuery.of(context).size;
    double fontSize = screenSize.width > 600 ? 24 : 18;
    double padding = screenSize.width > 600 ? 30.0 : 20.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          azkarName,
          style: TextStyle(fontSize: screenSize.width > 600 ? 30 : 20),
        ),
        backgroundColor: const Color(0xfff0ede8),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: screenSize.width > 600 ? 40 : 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/images/content.json"), // الملف الخاص بالأذكار
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error.toString()}"));
          }

          if (snapshot.hasData) {
            List azkarContent = json.decode(snapshot.data!);
   List filteredAzkar=        azkarContent.where((data)=>data['section_id']==azkarId).toList();

            if (filteredAzkar.isEmpty) {
              return Center(child: Text("لا توجد أذكار متاحة لهذا القسم."));
            } else {
              return ListView.builder(
                itemCount: filteredAzkar.length,
                itemBuilder: (context, index) {
                  var data = filteredAzkar[index];
                  return Padding(
                    padding: EdgeInsets.all(padding),
                    child: Card(
                      elevation: 10,
                      color: const Color(0xfff0ede8),
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: ListTile(
                          title: Text(
                            data['reference'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            data['content'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
