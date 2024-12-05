import 'package:alquran/cubits/cubit/languge_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static String id = "setting";

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xfff0ede8),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black, 
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/back.jpg",
                  width: screenWidth,
                  height: screenHeight,
                  fit: BoxFit.cover,
                ),
               
              ],
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
            children: [
              
              
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, languageState) {
                  return ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    trailing: DropdownButton<String>(
                      value: context.read<LanguageCubit>().currentLanguage,
                      items: const [
                        DropdownMenuItem(value: "en", child: Text("English")),
                        DropdownMenuItem(value: "ar", child: Text("Arabic")),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          context.read<LanguageCubit>().changeLanguage(value);
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
