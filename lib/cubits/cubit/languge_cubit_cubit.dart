import 'package:bloc/bloc.dart';

part 'languge_cubit_state.dart';


class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageEnglishState());

  String currentLanguage = "en";

  void changeLanguage(String language) {
    currentLanguage = language;
    emit(language == "en" ? LanguageEnglishState() : LanguageArabicState());
  }
}

