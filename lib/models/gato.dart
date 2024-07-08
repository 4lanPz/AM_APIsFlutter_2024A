class Gato {
  final int statusCode;
  final String imageUrl;

  Gato({required this.statusCode, required this.imageUrl});

  factory Gato.fromStatusCode(int statusCode) {
    return Gato(
      statusCode: statusCode,
      imageUrl: 'https://http.cat/status/$statusCode',
    );
  }
}
