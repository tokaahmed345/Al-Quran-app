import 'package:alquran/widgets/customaudiocard.dart';
import 'package:alquran/widgets/customfirstcard.dart';
import 'package:flutter/material.dart';


class AudioSound extends StatefulWidget {
  static String id = 'audio_page';
  const AudioSound({super.key});

  @override 
  State<AudioSound> createState() => _AudioSoundState();
}

class _AudioSoundState extends State<AudioSound> {
  String currentSurahName = "Loading...";
  int currentSurahAyahCount = 0;
  late int currentSurahNum;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      currentSurahName = arguments['surahName'] ?? "Unknown";
      currentSurahAyahCount = arguments['totalAyahs'] ?? 0;
      currentSurahNum = arguments['surahNum'] ?? -1;
    });
  }

  void _updateSurahInfo(String surahName, int surAya) {
    setState(() {
      currentSurahName = surahName;
      currentSurahAyahCount = surAya;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff0ede8),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: screenWidth * 0.08, 
          ),
        ),
        title: Text(
          "Now Playing",
          style: TextStyle(
            color: Colors.black,
            fontSize: screenWidth * 0.06, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/back.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05,
              horizontal: screenWidth * 0.05,
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * 0.2, 
                  child: CustomFirstCard(
                    surName: currentSurahName,
                    surAya: currentSurahAyahCount,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomAudioCard(
                  surahNum: currentSurahNum,
                  onSurahChanged: _updateSurahInfo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
