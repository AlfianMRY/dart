import 'package:flutter/material.dart';

class CobaStepper extends StatefulWidget {
  const CobaStepper({super.key});

  @override
  State<CobaStepper> createState() => _CobaStepperState();
}

class _CobaStepperState extends State<CobaStepper> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Splash screen & Stepper"),
      ),
      body: Center(
        child: Stepper(
          onStepTapped: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
          currentStep: index,
          onStepContinue: () {
            if (index < 2) {
              setState(() {
                index += 1;
              });
            }
          },
          onStepCancel: () {
            if (index > 0) {
              setState(() {
                index -= 1;
              });
            }
          },
          type: StepperType.horizontal,
          steps: [
            Step(
              state: index == 0 ? StepState.indexed : StepState.complete,
              isActive: true,
              title: Text("Account"),
              subtitle: Text("Ini akun"),
              content: Column(
                children: [
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: "Masukkan email anda"),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(hintText: "Masukkan password anda"),
                  ),
                ],
              ),
            ),
            Step(
              isActive: index == 1 ? true : false,
              title: Text("Nama"),
              content: TextFormField(
                decoration: InputDecoration(hintText: "Masukkan nama anda"),
              ),
            ),
            Step(
              isActive: false,
              title: Text("Umur"),
              content: TextFormField(
                decoration: InputDecoration(hintText: "Masukkan Umur anda"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
