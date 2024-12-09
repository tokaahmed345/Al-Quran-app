import 'package:alquran/screens/azkar_contetnt.dart';
import 'package:alquran/widgets/item_row.dart';
import 'package:flutter/material.dart';

class Al_Azkar extends StatelessWidget {
  const Al_Azkar({super.key});
static String id="azkar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(title: Text("Al_Azkar"),
backgroundColor: Color(0xfff0ede8),
centerTitle: true,
leading: Icon(Icons.arrow_back_ios,size: 35,),
),

body: Stack(

  children:[
    Positioned.fill(child: Image.asset("assets/images/back.jpg")),
    
     ListView.builder(
    itemCount: 5,
    itemBuilder: (context,index){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, Azkar_Content.id);
        },
        child: ListTile(
          
             leading:    CircleAvatar(
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.black,
            ),
        
           trailing:    Text("اذكار الصباح ",style: TextStyle(fontSize: 29),)
        
        
        ,),
      ),
    );
  }),
]),

    );
  }
}