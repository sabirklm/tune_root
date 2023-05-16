import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/views/widgets/tune_root_short_card.dart';

import 'music_playing_animation.dart';

class MusicPlayer extends StatelessWidget {
  final Map<String, dynamic> music;
  final void Function()? onPressedClose;
  const MusicPlayer({
    super.key,
    required this.music, this.onPressedClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.green.shade900,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              music['imgurl'] ?? img,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                music['title'] ?? "",
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Binod Rathor, Alka Yagnik",
                style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              const MusicPlayingAnimation()
            ],
          ),
          const Spacer(
            flex: 10,
          ),
          IconButton(
            onPressed: onPressedClose,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
