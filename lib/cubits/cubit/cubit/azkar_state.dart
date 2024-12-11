part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}
final class Loading extends AzkarState {}

final class Succes extends AzkarState { final List content;

  Succes({required this.content});}
final class Failure extends AzkarState {final String errorMessage;

  Failure({required this.errorMessage});}
