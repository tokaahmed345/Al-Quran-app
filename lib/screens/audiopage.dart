import 'package:alquran/cubits/cubit/cubit/surah_cubit.dart';
import 'package:alquran/screens/audiosound.dart';
import 'package:alquran/widgets/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AudioHome extends StatelessWidget {
  const AudioHome({super.key});

  static String id = "audio";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => SurahCubit()..loadAllSurahs(), 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff0ede8),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 35,
            ),
          ),
          elevation: 0,
          title: const Text(
            "Audio",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/audio-speaker.png",
                width: screenWidth * 0.07, 
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/back.jpg',
                fit: BoxFit.cover,
              ),
            ),
            BlocBuilder<SurahCubit, SurahState>(
              builder: (context, state) {
                if (state is Loading) {
                  return Center(
                    child: SpinKitRipple(
                      color: const Color.fromARGB(255, 89, 58, 5),
                      size: screenWidth * 0.25, 
                    ),
                  );
                } else if (state is Success) {
                  final surahs = state.surahs;
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02, 
                      vertical: screenHeight * 0.02, 
                    ),
                    itemCount: surahs.length,
                    itemBuilder: (context, index) {
                      final dataSurah = surahs[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AudioSound.id,
                            arguments: {
                              'surahName': dataSurah.name,
                              'totalAyahs': dataSurah.ayahs?.length ?? 0,
                              'surahNum': dataSurah.number ?? -1
                            },
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
                      "Error: ${state.message}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return const SizedBox.shrink(); 
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
