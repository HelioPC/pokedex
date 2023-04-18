class Base {
  final int hp;
  final int attack;
  final int defense;
  final int sp_attack;
  final int sp_defense;
  final int speed;

  Base({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.sp_attack,
    required this.sp_defense,
    required this.speed,
  });

  factory Base.fromMap(Map<String, dynamic> json) {
    return Base(
      hp: json['HP'],
      attack: json['Attack'],
      defense: json['Defense'],
      sp_attack: json['Sp. attack'],
      sp_defense: json['Sp. defense'],
      speed: json['Speed'],
    );
  }
}
