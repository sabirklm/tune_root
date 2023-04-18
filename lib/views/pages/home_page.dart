import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/views/pages/sample_page.dart';
import 'package:tuneroot_application/views/widgets/login_sign_up_card.dart';
import 'package:tuneroot_application/views/widgets/snackbar.dart';
import 'package:tuneroot_application/views/widgets/sponsored_card.dart';

import '../widgets/tune_root_short_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String title = "";
  final _tuneRoot = "TuneRoot";
  late AnimationController _controller;
  bool isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.animateTo(
      1.0,
      duration: const Duration(seconds: 1),
    );
    if (!isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showDialog(
          context: context,
          builder: (context) => const LoginSignUpCard(
            title: "Tune Root",
          ),
        );
      });
    }
    _controller.addListener(() {
      setState(() {
        // print((_controller.value * (_tuneRoot.length)).toInt());
        var temp = (_controller.value * (_tuneRoot.length - 1)).toInt();
        title += _tuneRoot[temp];
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  showOverlay(BuildContext context) async {
    var state = Overlay.of(context);
    OverlayEntry? instanceOfEntry;
    var entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.pinkAccent,
            ),
            padding: const EdgeInsets.all(16),
            width: 220,
            height: 220,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        instanceOfEntry!.remove();
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
    state.insert(entry);
    instanceOfEntry = entry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInQuart,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Padding(
                padding: EdgeInsets.only(top: value * 16, bottom: 16),
                child: child,
              ),
            );
          },
          child: Text(
            "TuneRoot",
            style: GoogleFonts.tillana(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white60,
              ),
            ),
            child: MaterialButton(
              onPressed: () {},
              clipBehavior: Clip.hardEdge,
              child: Text(
                "Upgrade",
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const _ProfileHeading(
            name: "Sabir Mondal",
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.green.shade900,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                img,
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
                  "Ae Mere Humsafar (from Bazigar)",
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
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: Column(
              children: [
                ListTile(
                  key: const Key('PRESS'),
                  onTap: () {
                    log("___HomeItemClicked");
                  },
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: Text(
                    "Home",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.search,
                  ),
                  title: Text(
                    "Search",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.my_library_books_outlined,
                  ),
                  title: Text(
                    "Your Library",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.playlist_add,
                  ),
                  title: Text(
                    "Create Playlist",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.favorite_outline_sharp,
                  ),
                  title: Text(
                    "Liked Songs",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SponsoredCard(),
                ...List.generate(
                  12,
                  (index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tune Root",
                              style: GoogleFonts.roboto(
                                fontSize: 24,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //TODO:Show all audio
                              },
                              child: Text(
                                "See All",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 320,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              10,
                              (index) => TuneRootShortCard(
                                onPressedPlay: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    showSnackbar(
                                        context: context,
                                        message: "Can't play right now."),
                                  );
                                },
                                onTapTuneRootCard: () {
                                  // var route = MaterialPageRoute(
                                  //   builder: (context) =>
                                  //       const GridMagnification(),
                                  // );
                                  // Navigator.push(context, route);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProfileHeading extends StatelessWidget {
  final String name;
  const _ProfileHeading({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: const Color.fromARGB(221, 78, 78, 78),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black87,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            name,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
