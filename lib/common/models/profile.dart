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

  double get maleGender => double.tryParse(gender.split(':')[0]) ?? 0;
  double get femaleGender => double.tryParse(gender.split(':')[1]) ?? 0;
  bool get isGenderless => gender == 'Genderless';

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
