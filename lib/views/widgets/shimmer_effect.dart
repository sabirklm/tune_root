import 'dart:developer';

import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
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
        if (_controller.isCompleted) {
          _controller.repeat(period: Duration(seconds: 3));
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          10,
          (index) => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(8),
            //width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(_controller.value),
                  Colors.black.withOpacity(1.0 - _controller.value)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
