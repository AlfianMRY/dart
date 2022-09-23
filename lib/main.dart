import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:cron/cron.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CobaCron(),
    );
  }
}

class CobaCron extends StatelessWidget {
  CobaCron({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Cron'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                jadwal();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Memulai Jadwal',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => cancelJadwal(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Cancel Jadwal',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final cron = Cron();
  ScheduledTask? task;

  void jadwal() {
    log("wait for schedule");
    task = cron.schedule(Schedule.parse('*/1 * * * *'), () async {
      print("Waktu sekarang : ${DateTime.now()}");
    });
  }

  void cancelJadwal() {
    task!.cancel();
    print('Berhasil cancel jadwal');
  }
}
