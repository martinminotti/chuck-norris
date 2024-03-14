import 'dart:io';
import 'dart:math';
import 'package:chuck_norris/chuck_norris_facts.dart' as chuck_norris;
import 'package:dotenv/dotenv.dart';

void main(List<String> arguments) async {


  // Creo un'istanza di DotEnv e carico le variabili d'ambiente dal file .env
  final env = DotEnv()..load();
  final dynamic data;
  

  // Ottengo le categorie dai dati dell'ambiente e le divido in una lista
  final categories = env["categories"]!.split(","); 
  final randomCategory = categories[Random().nextInt(categories.length)]; // categoria casuale


  print("Scrivi una query o premi invio per ottenere una citazione di Chuck Norris casuale:");
  String? query = stdin.readLineSync(); // Leggo l'input dell'utente



  if (query == "") {
    data = await chuck_norris.getChuckCategory(randomCategory); // Ottengo una barzelletta casuale
  } else {
    data = await chuck_norris.getChuckQuery(query); // Ottengo una barzelletta basata sulla query dell'utente
  }


  //Se data è diverso da null, stampo la barzelletta ottenuta e la scrivo nel file "facts.txt"
  if (data != null) {
    print(data);
  } else {
    print("ERRORE");
  }
}
