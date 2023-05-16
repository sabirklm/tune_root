import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/views/widgets/tune_root_short_card.dart';

class SponsoredCard extends StatefulWidget {
  const SponsoredCard({super.key});

  @override
  State<SponsoredCard> createState() => _SponsoredCardState();
}

class _SponsoredCardState extends State<SponsoredCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(2),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            ...List.generate(4, (index) => Colors.black),
            ...List.generate(1, (index) => Colors.black26),
         
          ],
        ),
      ),
      child: Row(
        children: [
          Image.network(
            img,
            width: 180,
            height: 180,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onLongPressStart: (details) {
                  log("____$details");
                },
                child: Text(
                  "PLAYLIST",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  "Top Trending India",
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 64,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                "Listen to India's top viral tracks!",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 50),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Play",
                      style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white60),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      clipBehavior: Clip.hardEdge,
                      child: Text(
                        "Follow",
                        style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
