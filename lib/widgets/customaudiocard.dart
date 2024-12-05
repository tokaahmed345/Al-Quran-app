import 'package:alquran/models/audios.dart';
import 'package:alquran/services/audioservices.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class CustomAudioCard extends StatefulWidget {
  final int surahNum;
  final void Function(String surName, int surAya) onSurahChanged;

  const CustomAudioCard({
    super.key,
    required this.surahNum,
    required this.onSurahChanged,
  });

  @override
  State<CustomAudioCard> createState() => _CustomAudioCardState();
}

class _CustomAudioCardState extends State<CustomAudioCard> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLoading = false; 
  int currentSurahIndex = 0;
  int currentAyahIndex = 0;
  AudioSurhas? surahAudioModel;
  AudioServices audioServices = AudioServices();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchSurahAudio() async {
    setState(() {
      isLoading = true;
    });

    AudioSurhas fetchedAudio = await audioServices.loadAudio();

    setState(() {
      surahAudioModel = fetchedAudio;
      currentSurahIndex = surahAudioModel!.data!.surahs!
          .indexWhere((surah) => surah.number == widget.surahNum);

      widget.onSurahChanged(
        surahAudioModel!.data!.surahs![currentSurahIndex].name!,
        surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!.length,
      );

      isLoading = false;
    });
  }

  Future<void> _playAudio() async {
    if (surahAudioModel == null) {
      await _fetchSurahAudio();
    }

    if (surahAudioModel != null) {
      final List<Ayahs> ayahs = surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!;

      for (int i = currentAyahIndex; i < ayahs.length; i++) {
        setState(() {
          currentAyahIndex = i; 
        });

        await _audioPlayer.play(UrlSource(ayahs[i].audio!));
        await _audioPlayer.onPlayerComplete.first;

        if (!isPlaying) break; 
      }

      if (isPlaying) {
        setState(() {
          isPlaying = false; 
          currentAyahIndex = 0; 
        });
      }
    }
  }

  Future<void> _pauseAudio() async {
    await _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void _previousSurah() {
    if (currentSurahIndex > 0) {
      setState(() {
        currentSurahIndex--;
        currentAyahIndex = 0;

        widget.onSurahChanged(
          surahAudioModel!.data!.surahs![currentSurahIndex].name!,
          surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!.length,
        );

        _playAudio();
      });
    }
  }

  void _nextSurah() {
    if (currentSurahIndex < surahAudioModel!.data!.surahs!.length - 1) {
      setState(() {
        currentSurahIndex++;
        currentAyahIndex = 0;

        widget.onSurahChanged(
          surahAudioModel!.data!.surahs![currentSurahIndex].name!,
          surahAudioModel!.data!.surahs![currentSurahIndex].ayahs!.length,
        );

        _playAudio();
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: const Color(0xfff0ede8),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.015, // Dynamic vertical padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _previousSurah,
              icon: Icon(
                Icons.skip_previous,
                size: screenWidth * 0.08, // Dynamic icon size
              ),
            ),
            Card(
              elevation: 10,
              shadowColor: const Color(0xfffa1ced6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.1), // Dynamic border radius
              ),
              color: const Color(0xfffa1ced6),
              child: IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await _pauseAudio();
                  } else {
                    setState(() {
                      isPlaying = true;
                    });
                    await _playAudio();
                  }
                },
                icon: isLoading
                    ? SizedBox(
                        width: screenWidth * 0.05, // Dynamic loader size
                        height: screenWidth * 0.05,
                        child: const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: screenWidth * 0.07, // Dynamic play/pause icon size
                      ),
              ),
            ),
            IconButton(
              onPressed: _nextSurah,
              icon: Icon(
                Icons.skip_next,
                size: screenWidth * 0.08, // Dynamic icon size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
