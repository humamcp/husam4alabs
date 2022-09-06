import 'package:flutter/material.dart';
import 'package:husam4alabs/mixins/loading_state_mixin.dart';
import 'package:husam4alabs/style/theme.dart';
import 'dart:math' as math;

import 'package:husam4alabs/utils/string_to_color.dart';

class PostsView extends StatefulWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> with LoadingStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: -125,
            left: -MediaQuery.of(context).size.width * 1.25,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.5,
                height: MediaQuery.of(context).size.width * 1.5,
                decoration: BoxDecoration(
                  color: "E1F6F4".toColor(),
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    '',
                    style: AppTheme.TEXT_SUB_STYLE,
                  ),
                  background: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Row(
                          children: const [
                            SizedBox(width: 20),
                            Text(
                              'Socially',
                              style: AppTheme.TEXT_SUB_STYLE,
                            ),
                            Expanded(
                              child: Text(''),
                            ),
                            Icon(Icons.notifications),
                            SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Feed',
                            style: AppTheme.TEXT_TITLE_STYLE,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // profiles
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          alignment: Alignment.center,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _status(0),
                              _status(1),
                              _status(2),
                              _status(3),
                              _status(4),
                              _status(1),
                              _status(2),
                              _status(3),
                              _status(4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // posts
                    _post(1),
                    _post(2),
                    _post(3),
                    _post(4),
                    _post(1),
                    _post(2),
                    _post(3),
                    _post(4),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _status(int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            "E1F6F4".toColor(),
            "ced1d1".toColor(),
          ],
        ),
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: index == 0
          ? Icon(
              Icons.add_circle,
              size: MediaQuery.of(context).size.height * 0.05,
            )
          : CircleAvatar(
              maxRadius: MediaQuery.of(context).size.height * 0.1 / 2,
              backgroundImage: AssetImage('assets/images/ch$index.jpg'),
            ),
    );
  }

  _post(int index) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            offset: const Offset(1, 1),
            blurRadius: 10,
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/images/post$index.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // top bar
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage('assets/images/ch${index % 3 + 1}.jpg'),
                ),
                const SizedBox(width: 5),
                Column(
                  children: [
                    const Text(
                      'Jon Due',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '2hrs ago',
                      style: TextStyle(
                        color: Colors.white.withAlpha(200),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Text(''),
                ),
                const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                )
              ],
            ),
          ),
          // bottom bar
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _statics(Icons.favorite_border, '5.2K'),
                _statics(Icons.messenger_outline, '1.1K'),
                _statics(Icons.class_outlined, '312'),
              ],
            ),
          )
        ],
      ),
    );
  }

  _statics(IconData icon, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(100),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
