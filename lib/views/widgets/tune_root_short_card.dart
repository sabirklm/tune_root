import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var img =
    "https://getwallpapers.com/wallpaper/full/0/d/0/1364961-vertical-tropical-island-wallpapers-1920x1200-for-android-40.jpg";

class TuneRootShortCard extends StatelessWidget {
  final void Function()? onTapTuneRootCard;
  const TuneRootShortCard({
    super.key, this.onTapTuneRootCard,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap:onTapTuneRootCard ,
        child: Ink(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.deepPurple.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  img,
                  width: 160,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Tune Root",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "See the unknown",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
