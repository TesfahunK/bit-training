import 'package:bit_initial/data/models/character.dart';
import 'package:bit_initial/utils/ui/basic-widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  void showDetailSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.black.withOpacity(0),
        isScrollControlled: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return CharacterBottomSheet(
                character: character,
                controller: scrollController,
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDetailSheet(context);
      },
      leading: networkImageLoader(url: character.image, height: 50, width: 50),
      title: Text(
        character.name,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          Icon(
            CupertinoIcons.globe,
            color: Colors.green,
            size: 15,
          ),
          Text(
            character.origin.name,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
      trailing: Wrap(
        spacing: 10,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.accessibility,
            color: Colors.green,
            size: 15,
          ),
          Text(
            character.species,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

class CharacterBottomSheet extends StatelessWidget {
  final CharacterModel character;
  final ScrollController controller;
  const CharacterBottomSheet(
      {Key? key, required this.character, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                  child: Stack(
                children: [
                  networkImageLoader(
                      radius: 0,
                      url: character.image,
                      height: 300,
                      width: double.maxFinite),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ))
                ],
              )),
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    character.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.globe,
                      color: Colors.green,
                    ),
                    FittedBox(
                      child: Text(
                        character.origin.name,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                    Text(
                      character.location.name,
                    ),
                  ],
                ),
                Divider(),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: tr("detail.gender") + " - ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: character.gender,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300))
                            ])),
                        RichText(
                            text: TextSpan(
                                text: tr("detail.species") + " - ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: character.species,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300))
                            ])),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: tr("detail.status") + " - ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: character.status,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300))
                            ])),
// Expanded(child: child)
                      ],
                    ))
              ]))
            ]));
  }
}
