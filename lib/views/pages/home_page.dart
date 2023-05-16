// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/models/model.dart';
import 'package:tuneroot_application/services/imp/music_service.dart';
import 'package:tuneroot_application/views/pages/library_page.dart';
import 'package:tuneroot_application/views/pages/liked_page.dart';
import 'package:tuneroot_application/views/pages/play_list_page.dart';
import 'package:tuneroot_application/views/pages/search_page.dart';
import 'package:tuneroot_application/views/widgets/login_sign_up_card.dart';
import 'package:tuneroot_application/views/widgets/snackbar.dart';
import 'package:tuneroot_application/views/widgets/sponsored_card.dart';

import '../widgets/music_player.dart';
import '../widgets/music_playing_animation.dart';
import '../widgets/tune_root_short_card.dart';

enum HOMEVIEWTYPE {
  music,
  search,
  library,
  playList,
  liked,
}

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
  bool isAuthenticated = true;
  HOMEVIEWTYPE homeviewtype = HOMEVIEWTYPE.music;
  Map<String, dynamic> musics = {};
  Map<String, dynamic>? musicToPlay;
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    _getMusics();
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

  _getMusics() async {
    var temp = await MusicService().getMusics();
    setState(() {
      musics.addAll(temp);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // showOverlay(BuildContext context) async {
  //   var state = Overlay.of(context);
  //   OverlayEntry? instanceOfEntry;
  //   var entry = OverlayEntry(
  //     builder: (context) {
  //       return Positioned(
  //         right: 8,
  //         bottom: 8,
  //         child: Container(
  //           margin: const EdgeInsets.all(16),
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(16),
  //             color: Colors.pinkAccent,
  //           ),
  //           padding: const EdgeInsets.all(16),
  //           width: 220,
  //           height: 220,
  //           child: Column(
  //             children: [
  //               Row(
  //                 children: [
  //                   IconButton(
  //                     onPressed: () {
  //                       instanceOfEntry!.remove();
  //                     },
  //                     icon: const Icon(
  //                       Icons.close,
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   state.insert(entry);
  //   instanceOfEntry = entry;
  // }

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
              fontSize: 32,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
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
      bottomNavigationBar: musicToPlay != null
          ? MusicPlayer(
              music: musicToPlay!,
              onPressedClose: () {
                audioPlayer.stop();
                setState(() {
                  musicToPlay = null;
                });
              },
            )
          : null,
      body: Row(
        children: [
          SizedBox(
            width: 220,
            child: Column(
              children: [
                ListTile(
                  key: const Key('home-drawer-key'),
                  onTap: () {
                    setState(() {
                      homeviewtype = HOMEVIEWTYPE.music;
                    });
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
                  key: const Key('search-drawer-key'),
                  onTap: () {
                    setState(() {
                      homeviewtype = HOMEVIEWTYPE.search;
                    });
                  },
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
                  key: const Key('library-drawer-key'),
                  onTap: () {
                    setState(() {
                      homeviewtype = HOMEVIEWTYPE.library;
                    });
                  },
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
                  onTap: () {
                    setState(() {
                      homeviewtype = HOMEVIEWTYPE.playList;
                    });
                  },
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
                  onTap: () {
                    setState(() {
                      homeviewtype = HOMEVIEWTYPE.liked;
                    });
                  },
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
          if (homeviewtype == HOMEVIEWTYPE.search) const SearchPage(),
          if (homeviewtype == HOMEVIEWTYPE.library) const LibraryPage(),
          if (homeviewtype == HOMEVIEWTYPE.playList) const PlayListPage(),
          if (homeviewtype == HOMEVIEWTYPE.liked) const LikedPage(),
          if (homeviewtype == HOMEVIEWTYPE.music)
            Expanded(
              child: ListView(
                children: [
                  const SponsoredCard(),
                  ...musics.keys
                      .map(
                        (e) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    e,
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
                                    musics[e]!.length,
                                    (index) => TuneRootShortCard(
                                      imgurl: musics[e]![index]["imgUrl"],
                                      onPressedPlay: () async {
                                        var url = musics[e]![index]["url"];
                                        print("___MusicUrl $url");
                                        await audioPlayer.play(UrlSource(url),
                                            volume: 1.0);

                                        setState(() {
                                          musicToPlay = musics[e]![index];
                                        });
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   showSnackbar(
                                        //     context: context,
                                        //     message: "Can't play right now.",
                                        //   ),
                                        // );
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
                      )
                      .toList(),
                ],
              ),
            ),
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
      margin: const EdgeInsets.only(
        right: 8,
      ),
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
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
