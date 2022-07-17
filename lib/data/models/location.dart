import 'dart:convert';

class LocationMini {
  final String id;

  final String name;
  final String dimension;
  LocationMini({
    required this.id,
    required this.name,
    required this.dimension,
  });

  LocationMini copyWith({
    String? id,
    String? name,
    String? dimension,
  }) {
    return LocationMini(
      id: id ?? this.id,
      name: name ?? this.name,
      dimension: dimension ?? this.dimension,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dimension': dimension,
    };
  }

  factory LocationMini.fromMap(Map<String, dynamic> map) {
    return LocationMini(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      dimension: map['dimension'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationMini.fromJson(String source) =>
      LocationMini.fromMap(json.decode(source));

  @override
  String toString() =>
      'LocationMini(id: $id, name: $name, dimension: $dimension)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationMini &&
        other.id == id &&
        other.name == name &&
        other.dimension == dimension;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ dimension.hashCode;
}
