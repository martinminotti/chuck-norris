import 'dart:convert';


//Creo la classe ChuckNorris con i campi category, id, fact e createdAt
class ChuckNorris {
  String category;
  String id;
  String fact;
  String createdAt;
  ChuckNorris(
      {required this.category,
      required this.id,
      required this.fact,
      required this.createdAt});


//Faccio l'override del metodo toString per stampare i dati in modo leggibile in una stringa
  @override
  String toString() {
    return " ID: $id\n Creato il: $createdAt\n Categoria: $category\n Citazione: $fact";
  }



  factory ChuckNorris.fromJson(String jsonString) {
    final Map<String, dynamic> data = json.decode(jsonString);
    return ChuckNorris.fromMap(data);
  }



  factory ChuckNorris.fromMap(Map<String, dynamic> map) {
    final chuck = ChuckNorris(
        fact: map["value"],
        id: map["id"],
        createdAt: map["created_at"],
        category: map["categories"].toString());
    return chuck;
  }
}
