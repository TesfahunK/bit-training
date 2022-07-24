import 'package:bit_initial/data/database/local.dart';
import 'package:bit_initial/data/models/character.dart';
import 'package:bit_initial/ui/widgets/rick-morty/character-card.dart';
import 'package:bit_initial/utils/injector.dart';
import 'package:bit_initial/utils/ui/basic-widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SavedItemListScreen extends StatefulWidget {
  const SavedItemListScreen({Key? key}) : super(key: key);

  @override
  State<SavedItemListScreen> createState() => _SavedItemListScreenState();
}

class _SavedItemListScreenState extends State<SavedItemListScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.blueGrey,
              unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
              labelStyle: TextStyle(color: Colors.black, fontSize: 12),
              controller: tabController,
              tabs: ["characters", "episodes", "locations"]
                  .map((e) => Tab(
                        child: Text(tr(e)),
                      ))
                  .toList()),
          preferredSize: Size(double.maxFinite, 50)),
      body: TabBarView(controller: tabController, children: [
        CharacterTab(),
        Container(
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
        ),
      ]),
    );
  }
}

class CharacterTab extends StatelessWidget {
  const CharacterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Characterz>>(
        initialData: [],
        stream: getIt
            .get<BitTrainingDatabase>()
            .characterDao
            .getAllSavedCharacters(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Characterz>> snapshot) {
          return snapshot.data!.isEmpty
              ? emptyList(icon: Icons.heart_broken, msg: "No Saved Characters")
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) {
                    return CharacterCard(
                        character:
                            CharacterModel.fromDatabase(snapshot.data![index]));
                  });
        });
  }
}
