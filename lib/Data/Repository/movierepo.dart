import 'package:dio/dio.dart';
import 'package:tasks2/Data/Model/moviemodel.dart';

class Repository {
  Dio dio = Dio();
  Future<List<MovieModel>> getApiValue() async {
    try {
      var response = await Dio().get('https://yts.mx/api/v2/list_movies.json');

      List<MovieModel> movie = (response.data["data"]["movies"] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();

      print(movie.length);
      return movie;
    } catch (e) {
      throw e;
    }
  }
}
