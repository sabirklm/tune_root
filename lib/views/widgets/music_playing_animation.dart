import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MusicPlayingAnimation extends StatelessWidget {
  const MusicPlayingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 30,
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: index.isEven
                ? Theme.of(context).primaryColor
                : Theme.of(context).highlightColor,
          ),
        );
      },
    );
  }
}
