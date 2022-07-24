// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bit_initial/data/models/character.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'local.g.dart';

@DataClassName('Characterz')
class CharacterTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get gender => text()();
  TextColumn get image => text()();
  TextColumn get species => text()();
  TextColumn get status => text()();
  TextColumn get type => text()();
  TextColumn get location => text()();
  TextColumn get origin => text()();
  DateTimeColumn get saved_at =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id};
}

@singleton
@DriftDatabase(tables: [CharacterTable], daos: [CharacterDao])
class BitTrainingDatabase extends _$BitTrainingDatabase {
  // we tell the database where to store the data with this constructor
  BitTrainingDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'bit.sqlite'));
    return NativeDatabase(
      file,
    );
  });
}

@DriftAccessor(tables: [CharacterTable])
class CharacterDao extends DatabaseAccessor<BitTrainingDatabase>
    with _$CharacterDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CharacterDao(BitTrainingDatabase db) : super(db);

  Stream<List<Characterz>> getAllSavedCharacters() {
    return select(characterTable).watch();
  }

  Future saveCharacter(CharacterModel model) async {
    await into(characterTable).insert(CharacterTableCompanion.insert(
        id: model.id,
        name: model.name,
        gender: model.gender,
        image: model.image,
        species: model.species,
        status: model.status,
        type: model.type,
        location: model.location.toJson(),
        origin: model.origin.toJson()));
  }

  Future deleteCharcter(String id) async {
    await (delete(characterTable)..where((t) => t.id.equals(id))).go();
  }
}
