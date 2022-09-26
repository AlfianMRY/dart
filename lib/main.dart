import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'merubah_warna.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MerubahWarna>(
      create: (context) => MerubahWarna(),
      child: Consumer<MerubahWarna>(
        builder: (context, tema, _) => Scaffold(
          backgroundColor: tema.backWarna,
          appBar: AppBar(
            backgroundColor: tema.appWarna,
            title: const Text("Not Using Provider"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<MerubahWarna>(
                    builder: (context, tema, _) => Text(
                      "Merubah Warna",
                      style: TextStyle(fontSize: 20, color: tema.teksWarna),
                    ),
                  ),
                  Consumer<MerubahWarna>(
                    builder: (context, tema, _) => Switch(
                        value: tema.isWarna,
                        onChanged: (value) {
                          tema.isWarna = value;
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
