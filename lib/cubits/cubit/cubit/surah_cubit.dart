
import 'package:alquran/models/suraha.dart';
import 'package:alquran/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit() : super(SurahInitial());

  Future<void> loadSajdaSurahs() async {
    emit(Loading());
    try {
      final ServiceApi data = ServiceApi();
      final suraha = await data.getSuraha(arName: " ", enName: " ", type: "", number: 0);
      final sajdaSurahs = suraha.data?.surahs?.where((suraha) {
        return suraha.ayahs?.any((e) => e.sajda != null && e.sajda != false) ?? false;
      }).toList() ?? [];
      if (sajdaSurahs.isNotEmpty) {
emit(Success(surahs: sajdaSurahs));
      } else {
      
emit(Failure(message:"No surahs contain Sajda."));
      
      }
    } catch (e) {
emit(Failure(message: e.toString()));
    }
  }




  Future<void> fetchSurahsByJuz(int juzNumber) async {
    emit(Loading());
    try {
  final ServiceApi api = ServiceApi();
  final sur= await api.getSurahsByJuz(juzNumber);
  
if(sur.isNotEmpty){
  emit(Success(surahs: sur));
}else{
  emit(Failure(message: "No surahs found for Juz $juzNumber"));
}
} on Exception catch (e) {
  emit(Failure(message:e.toString()));

}
  }


  Future<void> loadAllSurahs() async {
    emit(Loading()); // Emit Loading state
    try {
      final ServiceApi data = ServiceApi();
      final surahs = await data.getSuraha(arName: " ", enName: " ", type: "", number: 0);
      if (surahs.data?.surahs?.isNotEmpty ?? false) {
        emit(Success(surahs: surahs.data!.surahs!)); 
      } else {
        emit(Failure(message: "No surahs found"));
      }
    } catch (e) {
      emit(Failure(message: e.toString())); 
    }
  }




}
