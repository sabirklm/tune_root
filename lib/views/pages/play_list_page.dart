import 'dart:developer';
import 'package:flutter/material.dart';

import '../widgets/shimmer_effect.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.animateTo(1, duration: const Duration(seconds: 3));
    _controller.addListener(() {
      setState(() {
        // print((_controller.value * (_tuneRoot.length)).toInt());
        log("___controllerValue ${_controller.value}");
      });
    });
    // _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          LoadingShimmer(),
        ],
      ),
    );
  }
}
