part of 'surah_cubit.dart';

@immutable
sealed class SurahState {}

final class SurahInitial extends SurahState {}

final class Success extends SurahState {
  final List<Surahs>surahs;

  Success({required this.surahs});

}
final class Failure extends SurahState { final String message;

  Failure({required this.message});
}
final class Loading extends SurahState {}
