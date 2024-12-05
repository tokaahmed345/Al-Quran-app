import 'package:alquran/models/audios.dart';
import 'package:dio/dio.dart';

class AudioServices{

final  Dio dio =createsetup() ;
static Dio createsetup(){
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
request:  true,
requestBody: true,
error :true,
responseBody: true

  ));
  return dio;
}



Future<AudioSurhas> loadAudio()async{
  try {
  final response = await dio.get("http://api.alquran.cloud/v1/quran/ar.alafasy");

if(response.statusCode==200){
  return AudioSurhas.fromJson(response.data);
}else {
  throw Exception("error${response.data}");
}

} on Exception catch (e) {
throw Exception(e.toString());
}



}




}