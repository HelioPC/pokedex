class Types {
  final int slot;
  final Map<String, dynamic> type;

  Types({
    required this.slot,
    required this.type,
  });

  factory Types.fromMap(Map<String, dynamic> json) {
    return Types(
      slot: json['slot'],
      type: json['type'],
    );
  }
}
