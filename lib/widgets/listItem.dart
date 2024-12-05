import 'package:alquran/cubits/cubit/cubit/surah_cubit.dart';
import 'package:alquran/screens/suraha.dart';

import 'package:alquran/widgets/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => SurahCubit()..loadAllSurahs(), 
      child: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: SpinKitSpinningLines(
                color: Color.fromARGB(255, 89, 58, 5),
                size: screenWidth * 0.15,
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
                    Navigator.pushNamed(
                      context,
                      SurhaText.id,
                      arguments: dataSurah,
                    );
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
                "There is an Error: ${state.message}",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return const SizedBox.shrink(); 
          }
        },
      ),
    );
  }
}
