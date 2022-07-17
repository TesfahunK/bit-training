// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class EpisodeMini {
  final String id;
  final String air_date;
  final String name;
  final String episode;
  EpisodeMini({
    required this.id,
    required this.air_date,
    required this.name,
    required this.episode,
  });

  EpisodeMini copyWith({
    String? id,
    String? air_date,
    String? name,
    String? episode,
  }) {
    return EpisodeMini(
      id: id ?? this.id,
      air_date: air_date ?? this.air_date,
      name: name ?? this.name,
      episode: episode ?? this.episode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'air_date': air_date,
      'name': name,
      'episode': episode,
    };
  }

  factory EpisodeMini.fromMap(Map<String, dynamic> map) {
    return EpisodeMini(
      id: map['id'] ?? '',
      air_date: map['air_date'] ?? '',
      name: map['name'] ?? '',
      episode: map['episode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeMini.fromJson(String source) =>
      EpisodeMini.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EpisodeMini(id: $id, air_date: $air_date, name: $name, episode: $episode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EpisodeMini &&
        other.id == id &&
        other.air_date == air_date &&
        other.name == name &&
        other.episode == episode;
  }

  @override
  int get hashCode {
    return id.hashCode ^ air_date.hashCode ^ name.hashCode ^ episode.hashCode;
  }
}
