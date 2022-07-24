// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Characterz extends DataClass implements Insertable<Characterz> {
  final String id;
  final String name;
  final String gender;
  final String image;
  final String species;
  final String status;
  final String type;
  final String location;
  final String origin;
  final DateTime saved_at;
  Characterz(
      {required this.id,
      required this.name,
      required this.gender,
      required this.image,
      required this.species,
      required this.status,
      required this.type,
      required this.location,
      required this.origin,
      required this.saved_at});
  factory Characterz.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Characterz(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      species: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}species'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      origin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}origin'])!,
      saved_at: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}saved_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<String>(gender);
    map['image'] = Variable<String>(image);
    map['species'] = Variable<String>(species);
    map['status'] = Variable<String>(status);
    map['type'] = Variable<String>(type);
    map['location'] = Variable<String>(location);
    map['origin'] = Variable<String>(origin);
    map['saved_at'] = Variable<DateTime>(saved_at);
    return map;
  }

  CharacterTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterTableCompanion(
      id: Value(id),
      name: Value(name),
      gender: Value(gender),
      image: Value(image),
      species: Value(species),
      status: Value(status),
      type: Value(type),
      location: Value(location),
      origin: Value(origin),
      saved_at: Value(saved_at),
    );
  }

  factory Characterz.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Characterz(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      image: serializer.fromJson<String>(json['image']),
      species: serializer.fromJson<String>(json['species']),
      status: serializer.fromJson<String>(json['status']),
      type: serializer.fromJson<String>(json['type']),
      location: serializer.fromJson<String>(json['location']),
      origin: serializer.fromJson<String>(json['origin']),
      saved_at: serializer.fromJson<DateTime>(json['saved_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'image': serializer.toJson<String>(image),
      'species': serializer.toJson<String>(species),
      'status': serializer.toJson<String>(status),
      'type': serializer.toJson<String>(type),
      'location': serializer.toJson<String>(location),
      'origin': serializer.toJson<String>(origin),
      'saved_at': serializer.toJson<DateTime>(saved_at),
    };
  }

  Characterz copyWith(
          {String? id,
          String? name,
          String? gender,
          String? image,
          String? species,
          String? status,
          String? type,
          String? location,
          String? origin,
          DateTime? saved_at}) =>
      Characterz(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        species: species ?? this.species,
        status: status ?? this.status,
        type: type ?? this.type,
        location: location ?? this.location,
        origin: origin ?? this.origin,
        saved_at: saved_at ?? this.saved_at,
      );
  @override
  String toString() {
    return (StringBuffer('Characterz(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('location: $location, ')
          ..write('origin: $origin, ')
          ..write('saved_at: $saved_at')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, gender, image, species, status,
      type, location, origin, saved_at);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Characterz &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.image == this.image &&
          other.species == this.species &&
          other.status == this.status &&
          other.type == this.type &&
          other.location == this.location &&
          other.origin == this.origin &&
          other.saved_at == this.saved_at);
}

class CharacterTableCompanion extends UpdateCompanion<Characterz> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> gender;
  final Value<String> image;
  final Value<String> species;
  final Value<String> status;
  final Value<String> type;
  final Value<String> location;
  final Value<String> origin;
  final Value<DateTime> saved_at;
  const CharacterTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.image = const Value.absent(),
    this.species = const Value.absent(),
    this.status = const Value.absent(),
    this.type = const Value.absent(),
    this.location = const Value.absent(),
    this.origin = const Value.absent(),
    this.saved_at = const Value.absent(),
  });
  CharacterTableCompanion.insert({
    required String id,
    required String name,
    required String gender,
    required String image,
    required String species,
    required String status,
    required String type,
    required String location,
    required String origin,
    this.saved_at = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        gender = Value(gender),
        image = Value(image),
        species = Value(species),
        status = Value(status),
        type = Value(type),
        location = Value(location),
        origin = Value(origin);
  static Insertable<Characterz> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? gender,
    Expression<String>? image,
    Expression<String>? species,
    Expression<String>? status,
    Expression<String>? type,
    Expression<String>? location,
    Expression<String>? origin,
    Expression<DateTime>? saved_at,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (image != null) 'image': image,
      if (species != null) 'species': species,
      if (status != null) 'status': status,
      if (type != null) 'type': type,
      if (location != null) 'location': location,
      if (origin != null) 'origin': origin,
      if (saved_at != null) 'saved_at': saved_at,
    });
  }

  CharacterTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? gender,
      Value<String>? image,
      Value<String>? species,
      Value<String>? status,
      Value<String>? type,
      Value<String>? location,
      Value<String>? origin,
      Value<DateTime>? saved_at}) {
    return CharacterTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      species: species ?? this.species,
      status: status ?? this.status,
      type: type ?? this.type,
      location: location ?? this.location,
      origin: origin ?? this.origin,
      saved_at: saved_at ?? this.saved_at,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (saved_at.present) {
      map['saved_at'] = Variable<DateTime>(saved_at.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('status: $status, ')
          ..write('type: $type, ')
          ..write('location: $location, ')
          ..write('origin: $origin, ')
          ..write('saved_at: $saved_at')
          ..write(')'))
        .toString();
  }
}

class $CharacterTableTable extends CharacterTable
    with TableInfo<$CharacterTableTable, Characterz> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _speciesMeta = const VerificationMeta('species');
  @override
  late final GeneratedColumn<String?> species = GeneratedColumn<String?>(
      'species', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  @override
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String?> origin = GeneratedColumn<String?>(
      'origin', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _saved_atMeta = const VerificationMeta('saved_at');
  @override
  late final GeneratedColumn<DateTime?> saved_at = GeneratedColumn<DateTime?>(
      'saved_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        gender,
        image,
        species,
        status,
        type,
        location,
        origin,
        saved_at
      ];
  @override
  String get aliasedName => _alias ?? 'character_table';
  @override
  String get actualTableName => 'character_table';
  @override
  VerificationContext validateIntegrity(Insertable<Characterz> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('saved_at')) {
      context.handle(_saved_atMeta,
          saved_at.isAcceptableOrUnknown(data['saved_at']!, _saved_atMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Characterz map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Characterz.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CharacterTableTable createAlias(String alias) {
    return $CharacterTableTable(attachedDatabase, alias);
  }
}

abstract class _$BitTrainingDatabase extends GeneratedDatabase {
  _$BitTrainingDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $CharacterTableTable characterTable = $CharacterTableTable(this);
  late final CharacterDao characterDao =
      CharacterDao(this as BitTrainingDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [characterTable];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$CharacterDaoMixin on DatabaseAccessor<BitTrainingDatabase> {
  $CharacterTableTable get characterTable => attachedDatabase.characterTable;
}
