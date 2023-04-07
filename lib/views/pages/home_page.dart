import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/views/widgets/login_sign_up_card.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.animateTo(
      1.0,
      duration: const Duration(seconds: 1),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) => const LoginSignUpCard(
          title: "Tune Root",
        ),
      );
    });
    _controller.addListener(() {
      setState(() {
        print((_controller.value * (_tuneRoot.length)).toInt());
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
      appBar: AppBar(),
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
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
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
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
                                onTapTuneRootCard: () {
                                  showOverlay(context);
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
