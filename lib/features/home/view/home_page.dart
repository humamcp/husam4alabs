import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husam4alabs/mixins/loading_state_mixin.dart';
import 'package:husam4alabs/utils/string_to_color.dart';

import '../../feed/cubit/posts_cubit.dart';
import '../../feed/view/posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoadingStateMixin {
  // ### attributes ###
  int _index = 0; // the current viewed page

  // list of pages
  final List<Widget> _pages = const <Widget>[
    PostsPage(),
    PostsPage(),
    PostsPage(),
    PostsPage(),
  ];

  // ### Methods ###

  ///
  /// Change the current page to the indexed page
  ///
  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _index = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostCubit(),
        ),

        /// other providers must be implemnted here
      ],
      child: Scaffold(
        body: _pages.elementAt(_index),
        appBar: null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Image.asset('assets/images/btn2.png'),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 24,
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.home_outlined),
                  color: '7DB9B3'.toColor(),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.messenger_outline,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Text(''),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
