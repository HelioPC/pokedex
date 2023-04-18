class Evolution {
  final List<String> prev;
  final List<List<String>> next;

  Evolution({required this.prev, required this.next});

  factory Evolution.fromMap(Map<String, dynamic> json) {
    return Evolution(next: json['next'], prev: json['prev'] ?? []);
  }
}
