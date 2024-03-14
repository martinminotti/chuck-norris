import "dart:convert";
import "package:http/http.dart" as http;
import "models/chuck_norris.dart";


//uso Future<dynamic> per ottenere i dati in formato JSON da una URL
Future<dynamic> getJson(String url) async {
  final response = await http.get(Uri.parse(url));
  return response.body;
}

//uso Future<ChuckNorris> e faccio una chiamata API per ottenere una barzelletta di Chuck Norris
Future<ChuckNorris> getChuckCategory(String category) async {
  final url = "https://api.chucknorris.io/jokes/random?category=$category";

  final jsonString = await getJson(url);
  return ChuckNorris.fromJson(jsonString);
}
//qui invece uso Future<List<ChuckNorris>> per ottenere una
//lista di barzellette di Chuck Norris basate su una query inserita dall'utente
Future<List<ChuckNorris>> getChuckQuery(String? query) async {
  final url = "https://api.chucknorris.io/jokes/search?query=$query";

  final jsonString = await getJson(url);
  final List listJson = json.decode(jsonString)["result"];
  return listJson.map((e) => ChuckNorris.fromMap(e)).toList();

}
