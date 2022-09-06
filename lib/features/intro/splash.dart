import 'package:flutter/material.dart';
import 'package:husam4alabs/features/home/home.dart';
import 'dart:math' as math;
import 'package:husam4alabs/style/theme.dart';
import 'package:husam4alabs/utils/string_to_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int index = 0;
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: null,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: Stack(
          children: [
            // background
            Positioned(
              top: -100,
              left: -MediaQuery.of(context).size.width * 0.8,
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
            Column(
              children: [
                // title
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Welcome to'),
                      SizedBox(height: 4),
                      Text(
                        'Socially',
                        style: AppTheme.TEXT_TITLE_STYLE,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // image
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: ListView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            children: [
                              _image(1),
                              _image(1),
                              _image(1),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _circle(0),
                            const SizedBox(width: 5),
                            _circle(1),
                            const SizedBox(width: 5),
                            _circle(2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // bottom space
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
              ],
            ),
            // next button
            Positioned(
              bottom: -MediaQuery.of(context).size.height * 0.075,
              right: -MediaQuery.of(context).size.height * 0.075,
              child: InkWell(
                onTap: () {
                  if (mounted) {
                    Future.delayed(const Duration(milliseconds: 50)).then((_) {
                      if (mounted) {
                        _scrollController.animateTo(
                          index == 0
                              ? 0
                              : _scrollController.position.maxScrollExtent /
                                  (index == 1 ? 2 : 1),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    });

                    setState(() {
                      index++;
                    });
                    if (index > 2) {
                      index = 0;
                      if (mounted) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/btn1.png'),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Next ',
                        style: AppTheme.TEXT_STYLE,
                      ),
                      Transform.rotate(
                        angle: 3.14,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _image(int index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Image.asset(
          'assets/images/sp1.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _circle(int cur) {
    return Icon(
      index == cur ? Icons.circle : Icons.circle_outlined,
      color: Colors.black,
      size: 12,
    );
  }
}
