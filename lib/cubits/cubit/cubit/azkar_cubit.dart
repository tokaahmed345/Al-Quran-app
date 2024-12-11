import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());



loadazkar(){
  emit(Loading());
  
}





}
