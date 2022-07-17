import 'package:bit_initial/data/provider/counter/provider.dart';
import 'package:bit_initial/ui/screens/second-cunter-listnener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverPodCounter extends ConsumerWidget {
  const RiverPodCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(counterStateProvider);
    var dependentState = ref.watch(counterDependentStateProvider);
    var controller = ref.watch(counterStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Counter Example"),
      ),
      floatingActionButton: Wrap(
        spacing: 10,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              controller.add();
            },
            heroTag: "add",
          ),
          FloatingActionButton(
            child: Text(
              "-",
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              controller.sub();
            },
            heroTag: "sub",
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$dependentState",
                style: TextStyle(fontSize: 70),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$state",
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => SecondRiverPodCounter()));
                  },
                  child: Text("Take me"))
            ],
          ),
        ),
      ),
    );
  }
}
