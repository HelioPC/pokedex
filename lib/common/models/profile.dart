class Profile {
  final String height;
  final String weight;
  final String gender;
  final List<dynamic> egg;
  final List<dynamic> ability;

  Profile({
    required this.height,
    required this.weight,
    required this.gender,
    required this.egg,
    required this.ability,
  });

  factory Profile.fromMap(Map<String, dynamic> json) {
    return Profile(
      height: json['height'],
      weight: json['weight'],
      gender: json['gender'],
      egg: json['egg'],
      ability: json['ability'],
    );
  }
}
