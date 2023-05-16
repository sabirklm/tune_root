
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HFIDataCard extends StatelessWidget {
  const HFIDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 304,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "HRV: 35.6",
            style: GoogleFonts.lato(),
          ),
          Text(
            "DI = 35.6",
            style: GoogleFonts.lato(),
          ),
          Text(
            "W = 35.6",
            style: GoogleFonts.lato(),
          ),
        ],
      ),
    );
  }
}
