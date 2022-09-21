import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

// Package Animated

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animate Package'),
        ),
        body: SpinKitCircle(
          itemBuilder: (context, index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Animated Explicit dan ixplicit
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "flutter animate",
//       home: MyHomePage(titles: 'Flutter animation'),
//       debugShowMaterialGrid: false,
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.titles}) : super(key: key);
//   final titles;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   // double width = 100;
//   // double height = 100;
//   // double opacity = 1;
//   // double padding = 10;
//   // Color color = Colors.green.shade400;
//   late AnimationController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//       reverseDuration: Duration(seconds: 1),
//       lowerBound: 0,
//       upperBound: 100,
//     );
//     controller.addListener(() {
//       print(controller.value);
//       setState(() {});
//     });
//     // controller.forward();
//     // controller.reverse();
//     controller.repeat();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Animation flutter')),
//       body: Center(
//         // Animated Explicit
//         child: Container(
//           padding: EdgeInsets.only(
//             top: controller.value,
//           ),
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.green,
//           ),
//         ),
//         // Animated Ixplicut
//         // Animation Padding
//         // child: AnimatedPadding(
//         //   padding: EdgeInsets.symmetric(horizontal: padding),
//         //   duration: Duration(milliseconds: 100),
//         //   child: Container(
//         //     color: color,
//         //     height: height,
//         //   ),
//         // ),
//         // Animation Opacity
//         //child: AnimatedOpacity(
//         //   opacity: opacity,
//         //   duration: Duration(seconds: 1),
//         //   child: Container(
//         //     width: width,
//         //     height: height,
//         //     color: Colors.red,
//         //   ),
//         // ),
//         // Animation Container
//         // child: AnimatedContainer(
//         //   width: width,
//         //   height: height,
//         //   color: color,
//         //   duration: Duration(milliseconds: 500),
//         // ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             // Animated Explicit
//             // Animated Ixplicit
//             // Animation Padding
//             // padding = padding == 10 ? 40 : 10;
//             // animation Opacity
//             // opacity = opacity == 1 ? 0.2 : 1;
//             // Animation Container
//             //   width = width == 100 ? 200 : 100;
//             //   height = height == 100 ? 200 : 100;
//             //   color = color == Colors.green.shade400
//             //       ? Colors.green.shade100
//             //       : Colors.green.shade400;
//           });
//         },
//         child: const Icon(Icons.swap_horizontal_circle_outlined),
//       ),
//     );
//   }
// }
