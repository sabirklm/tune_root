import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackbar({required BuildContext context, String? message}) {
  return SnackBar(
    width: 220,
    content: Text(
      message ?? "",
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    ),
    padding: const EdgeInsets.all(8),
    backgroundColor: Theme.of(context).colorScheme.primary,
    behavior: SnackBarBehavior.floating,
    elevation: 4.6,
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
       8
      ),
    ),
  );
}
