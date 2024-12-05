import 'package:alquran/models/suraha.dart';
import 'package:dio/dio.dart';

class ServiceApi {

final Dio dio =createsetup() ;
  static Dio createsetup() {
    Dio dio = Dio();


    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      
    ));

    return dio;
  }
Future <Suraha>getSuraha({required String arName,required String enName,required String type,required int number,})async{

try {
  final response= await dio.get("https://api.alquran.cloud/v1/quran/quran-uthmani", data:{
  "number":number,
  "name":arName,
  "englishName":enName,
  "revelationType":type,
  
  });

if(response.statusCode==200){
  return Suraha.fromJson(response.data);
}else{
  throw Exception("failed${response.data}");
}
} on Exception catch (e) {
throw Exception(e.toString());

}



}
Future<List<Surahs>> getSurahsByJuz(int juz) async {
    try {
      final response = await dio.get("https://api.alquran.cloud/v1/quran/quran-uthmani");

      if (response.statusCode == 200) {
    
        final suraha = Suraha.fromJson(response.data);

        return     suraha.data?.surahs?.where((e)=>e.ayahs?.any((aya)=>aya.juz==juz)??false).toList()??[];
      } else {
        throw Exception("Failed to fetch data: ${response.data}");
      }
    } catch (e) {
      throw Exception("Error: ${e.toString()}");
    }
  }

  
}









