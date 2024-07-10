class Pokemon {
  final String name;
  final String url;
  String spriteUrl; // Nuevo atributo para la URL del sprite

  Pokemon({required this.name, required this.url, this.spriteUrl = ''});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}
