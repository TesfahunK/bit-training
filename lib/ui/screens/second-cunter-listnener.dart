import 'package:bit_initial/data/provider/counter/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondRiverPodCounter extends ConsumerWidget {
  const SecondRiverPodCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var state = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Two"),
      ),
      body: Container(
        child: Center(
          child: Text("$state"),
        ),
      ),
    );
  }
}
