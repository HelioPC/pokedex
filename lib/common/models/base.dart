class Base {
  final int hp;
  final int attack;
  final int defense;
  final int spAttack;
  final int spDefense;
  final int speed;

  Base({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.spAttack,
    required this.spDefense,
    required this.speed,
  });

  factory Base.fromMap(Map<String, dynamic> json) {
    return Base(
      hp: json['HP'],
      attack: json['Attack'],
      defense: json['Defense'],
      spAttack: json['Sp. Attack'],
      spDefense: json['Sp. Defense'],
      speed: json['Speed'],
    );
  }
}
