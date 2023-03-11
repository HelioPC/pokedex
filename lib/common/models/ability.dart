class Ability {
  final int slot;
  final bool isHidden;
  final Map<String, dynamic> ability;

  Ability({
    required this.slot,
    required this.isHidden,
    required this.ability,
  });

  factory Ability.fromMap(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      isHidden: json['is_hidden'] as bool,
      ability: json['ability'],
    );
  }
}
