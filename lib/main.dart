import 'package:alquran/cubits/cubit/languge_cubit_cubit.dart';
import 'package:alquran/screens/audiopage.dart';
import 'package:alquran/screens/audiosound.dart';
import 'package:alquran/screens/azkar.dart';
import 'package:alquran/screens/azkar_contetnt.dart';
import 'package:alquran/screens/content.dart';
import 'package:alquran/screens/homepage.dart';
import 'package:alquran/screens/juz.dart';
import 'package:alquran/screens/settings.dart';
import 'package:alquran/screens/suraha.dart';
import 'package:alquran/widgets/sajdalist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(
    BlocProvider(
     create: (context) => LanguageCubit(),
     child: const Al_Quran(),
   ),

  );
}

//MyApp
class Al_Quran extends StatelessWidget {
  const Al_Quran({super.key});

  
  @override
  Widget build(BuildContext context) {
  
        return BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, languageState) {
            Locale locale = Locale(context.read<LanguageCubit>().currentLanguage);

            return MaterialApp(
              debugShowCheckedModeBanner: false,
             
              locale: locale,
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                return supportedLocales.firstWhere(
                  (supportedLocale) =>
                      supportedLocale.languageCode == locale?.languageCode,
                  orElse: () => supportedLocales.first,
                );
              },
        routes: {
      
    HomePage.id:(context)=>HomePage(),
     Content.id:(context)=>Content(),
     AudioSound.id:(context)=>AudioSound(),
     SurhaText.id:(context)=>SurhaText(),
     SajdaList.id:(context)=>SajdaList(),
     JuzSuraha.id:(context)=>JuzSuraha(juzNumber: ModalRoute.of(context)!.settings.arguments as int ),
     AudioHome.id:(context)=>AudioHome(),
 
SettingPage.id:(context)=>SettingPage(),
Al_Azkar.id:(context)=>Al_Azkar(),
AzkarContent.id:(context)=>AzkarContent()


     },

     initialRoute: HomePage.id,
            );
          },
        );
      }
    
  }
