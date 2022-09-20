import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final introKey = GlobalKey<IntroductionScreenState>();

  var pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 18),
    bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionScreen(
        key: introKey,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Container(
                width: 150,
                child: Image.asset('asset/flutter.png'),
              ),
            ),
          ),
        ),
        pages: [
          PageViewModel(
            title: 'Fractional Shares',
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('asset/img1.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: 'Kids and teens',
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: Image.asset('asset/img2.jpg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Title of last page - reversed",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            reverse: true,
            image: Image.asset('asset/img3.jpg'),
            decoration: pageDecoration.copyWith(
                bodyFlex: 2,
                imageFlex: 3,
                bodyAlignment: Alignment.bottomCenter,
                imageAlignment: Alignment.topCenter),
          ),
        ],
        onDone: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomePage())),
        onSkip: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomePage())),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        done: const Text(
          'Done',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        next: const Icon(Icons.arrow_forward),
        controlsMargin: const EdgeInsets.all(16),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12)
            : const EdgeInsets.fromLTRB(8, 4, 8, 4),
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          color: const Color(0xFFBDBDBD),
          activeSize: const Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        dotsContainerDecorator: ShapeDecoration(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(child: const Text('Halaman Home Page')),
    );
  }
}
