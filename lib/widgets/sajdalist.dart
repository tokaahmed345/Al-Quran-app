import 'package:alquran/cubits/cubit/cubit/surah_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alquran/widgets/item_row.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../screens/suraha.dart';

class SajdaList extends StatelessWidget {
  static String id = "Sajda";

  const SajdaList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SurahCubit()..loadSajdaSurahs(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/back.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          BlocBuilder<SurahCubit, SurahState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(
                  child: SpinKitSpinningLines(
                    color: Color.fromARGB(255, 89, 58, 5),
                    size: 70,
                  ),
                );
              } else if (state is Success) {
                final surahs = state.surahs;
                return ListView.builder(
                  itemCount: surahs.length,
                  itemBuilder: (context, index) {
                    final dataSurah = surahs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SurhaText.id, arguments: dataSurah);
                      },
                      child: ItemInfo(
                        arabicName: dataSurah.name ?? " ",
                        enName: dataSurah.englishName ?? " ",
                        nummber: dataSurah.number ?? 0,
                        type: dataSurah.revelationType ?? " ",
                      ),
                    );
                  },
                );
              } else if (state is Failure) {
                return Center(
                  child: Text(
                    "No surahs contain Sajda: ${state.message}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
