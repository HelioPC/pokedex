class Evolution {
  final List<dynamic> prev;
  final List<dynamic> next;

  Evolution({required this.prev, required this.next});

  factory Evolution.fromMap(Map<String, dynamic> json) {
    return Evolution(next: json['next'] ?? [], prev: json['prev'] ?? []);
  }
}
