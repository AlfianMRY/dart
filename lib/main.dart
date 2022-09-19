import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get controller => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material&Cupertino'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: new InputDecoration(
                    hintText: "Ini menggunakan Material Widget",
                    labelText: "Nama Lengkap",
                    icon: Icon(Icons.people),
                  ),
                ),
                SizedBox(height: 16),
                CupertinoTextField(
                  obscureText: true,
                  controller: controller,
                  placeholder: 'ini menggunakan Cupertino Widget',
                  prefix: Icon(CupertinoIcons.person),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 14),
                        child: Text(
                          'Material Button',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    CupertinoButton.filled(
                        child: Text(
                          'Cupertino Button',
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
