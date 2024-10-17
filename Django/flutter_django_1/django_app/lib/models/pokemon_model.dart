class Pokemon {
  final String id;
  final String name;
  final String type;

  Pokemon({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      type: json['type'],
    );
  }
}
