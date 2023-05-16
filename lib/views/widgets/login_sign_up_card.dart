import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/views/pages/dash_board_page.dart';

class LoginSignUpCard extends StatelessWidget {
  final String title;
  final void Function()? onTapLogin;
  const LoginSignUpCard({
    super.key,
    required this.title,
    this.onTapLogin,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
        tileMode: TileMode.clamp,
      ),
      child: AlertDialog(
        backgroundColor: Colors.black,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Text(
                title,
                style: GoogleFonts.aBeeZee(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.2),
              ),
            ),
            Text(
              "Millions of songs.",
              style: GoogleFonts.aBeeZee(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Free on tuneroot.",
              style: GoogleFonts.aBeeZee(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 128, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(64),
              ),
              child: InkWell(
                onTap: onTapLogin,
                child: Text(
                  " LOGIN",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.2,
                  ),
                ),
                InkWell(
                  onTap: () {
                    //TODO:Write necessary actions for sign up
                    var route = MaterialPageRoute(
                      builder: (context) =>const DashboardPage(),
                    );
                    Navigator.push(context, route);
                  },
                  child: Text(
                    "SIGN UP",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
