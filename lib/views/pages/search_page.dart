import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuneroot_application/models/model.dart';
import 'package:tuneroot_application/services/imp/music_service.dart';
import 'package:tuneroot_application/views/widgets/category_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _cateories = <Category>[];
  @override
  void initState() {
    super.initState();
    _getCategories();
    setState(() {
      
    });
    _controller = AnimationController(vsync: this);
  }

  _getCategories() async {
    try {
      var temp = await MusicService().getCategories();
      _cateories.clear();
      setState(() {
        _cateories.addAll(temp);
      });
    } catch (e) {
      //TODO:DO NOTHING NOW;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Wrap(
                children: [
                  ...List.generate(
                    _cateories.length,
                    (index) => CategoryCard(
                      category: _cateories[index],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
