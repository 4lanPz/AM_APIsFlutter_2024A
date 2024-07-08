import '../models/gato.dart';

class ApiService {
  Future<List<Gato>> fetchGatoList() async {
    List<Gato> gatoList = [];
    for (int statusCode = 100; statusCode <= 103; statusCode++) {
      // Cambia el rango de statusCode según tus necesidades.
      gatoList.add(Gato.fromStatusCode(statusCode));
    }
    return gatoList;
  }
}
