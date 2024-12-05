import 'package:alquran/cubits/cubit/cubit/surah_cubit.dart';
import 'package:alquran/screens/suraha.dart';
import 'package:alquran/widgets/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class JuzSuraha extends StatelessWidget {
  static String id = "juz";
  final int juzNumber;

  const JuzSuraha({super.key, required this.juzNumber});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => SurahCubit()..fetchSurahsByJuz(juzNumber),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfff0ede8),
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
            title: Text(
              'Juz $juzNumber',
              style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05),
            ),
          ),
          body: Stack(children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/back.jpg",
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
            ),
            BlocBuilder<SurahCubit, SurahState>(builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: SpinKitSpinningLines(
                    color: Color.fromARGB(255, 89, 58, 5),
                    size: screenWidth * 0.2,
                  ),
                );
              } else if (state is Success) {
                final surha = state.surahs;
                return ListView.builder(
                  itemCount: surha.length,
                  itemBuilder: (context, index) {
                    final sur = surha[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SurhaText.id,
                          arguments: sur, 
                        );
                      },
                      child: ItemInfo(
                        arabicName: sur.name ?? " ",
                        enName: sur.englishName ?? " ",
                        nummber: sur.number ?? 0,
                        type: sur.revelationType ?? " ",
                      ),
                    );
                  },
                );
              } else if (state is Failure) {
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            })
          ])),
    );
  }
}
