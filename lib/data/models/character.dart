import 'dart:convert';

import 'package:bit_initial/data/models/location.dart';

class CharacterModel {
  final String id;
  final String name;
  final String gender;
  final String image;
  final String species;
  final String status;
  final String type;
  final LocationMini location;
  final LocationMini origin;
  CharacterModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.image,
    required this.species,
    required this.status,
    required this.type,
    required this.location,
    required this.origin,
  });

  CharacterModel copyWith({
    String? id,
    String? name,
    String? gender,
    String? image,
    String? species,
    String? status,
    String? type,
    LocationMini? location,
    LocationMini? origin,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      species: species ?? this.species,
      status: status ?? this.status,
      type: type ?? this.type,
      location: location ?? this.location,
      origin: origin ?? this.origin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'image': image,
      'species': species,
      'status': status,
      'type': type,
      'location': location.toMap(),
      'origin': origin.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      image: map['image'] ?? '',
      species: map['species'] ?? '',
      status: map['status'] ?? '',
      type: map['type'] ?? '',
      location: LocationMini.fromMap(map['location']),
      origin: LocationMini.fromMap(map['origin']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, gender: $gender, image: $image, species: $species, status: $status, type: $type, location: $location, origin: $origin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterModel &&
        other.id == id &&
        other.name == name &&
        other.gender == gender &&
        other.image == image &&
        other.species == species &&
        other.status == status &&
        other.type == type &&
        other.location == location &&
        other.origin == origin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        image.hashCode ^
        species.hashCode ^
        status.hashCode ^
        type.hashCode ^
        location.hashCode ^
        origin.hashCode;
  }
}
