class Stats {
  final int baseStat;
  final int effort;
  final Map<String, dynamic> stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stats.fromMap(Map<String, dynamic> json) {
    return Stats(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: json['stat'],
    );
  }
}
