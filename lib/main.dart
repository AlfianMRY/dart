import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _controllerFullname = TextEditingController();
  final _controllerUserName = TextEditingController();
  final _controllerPassword = TextEditingController();
  var _gender = "Laki - Laki";
  var _selectDays = [];
  double _curentSlider = 10;

  List<String> _days = [
    "senin",
    "selasa",
    "rabu",
    "kamis",
    "Jumat",
    "sabtu",
    "Minggu"
  ];

  var _passwordVisible = false;
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Material App Alfian",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: ListView(
            children: [
              _sizeBox(10),
              const ListTile(
                // contentPadding: EdgeInsets.symmetric(horizontal: 100),
                title: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              _sizeBox(10),
              _userNamePassword(),
              _sizeBox(10),
              _listTitle("Umur"),
              _slider(),
              _sizeBox(10),
              _listTitle("Gender"),
              _genderRadio(),
              _sizeBox(10),
              _listTitle("Pilih Hari Kerja"),
              _checkBox(),
              _sizeBox(40),
              _buttonRegister(),
              _sizeBox(20)
            ],
          ),
        ),
      ),
    );
  }

  Slider _slider() {
    return Slider(
      activeColor: Colors.redAccent,
      thumbColor: Colors.green,
      inactiveColor: Colors.green,
      max: 50,
      min: 10,
      divisions: 50,
      label: _curentSlider.round().toString(),
      value: _curentSlider,
      onChanged: (value) {
        setState(() => _curentSlider = value);
      },
    );
  }

  ListTile _listTitle(String value) {
    return ListTile(
      title: Text(
        "$value ",
        style:
            const TextStyle(fontWeight: FontWeight.w900, color: Colors.green),
      ),
    );
  }

  SizedBox _sizeBox(double value) {
    return SizedBox(
      height: value,
    );
  }

  Padding _genderRadio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              children: [
                Radio(
                  activeColor: Colors.green,
                  value: "Laki - Laki",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() => _gender = value.toString());
                  },
                ),
                Expanded(
                  child: Text("Laki-Laki"),
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              children: [
                Radio(
                  activeColor: Colors.green,
                  value: "Perempuan",
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() => _gender = value.toString());
                  },
                ),
                Expanded(
                  child: Text("Perempuan"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _checkBox() {
    return Column(
        children: List.generate(_days.length, (index) {
      String day = _days[index];
      return CheckboxListTile(
        activeColor: Colors.green,
        title: Text(day),
        value: _selectDays.contains(day),
        onChanged: (value) {
          if (value!) {
            _selectDays.add(day);
          } else {
            _selectDays.remove(day);
          }
          setState(() {});
          print(_selectDays);
        },
      );
    }));
  }

  Padding _userNamePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value == '' ? "Dont Empty" : null,
              controller: _controllerFullname,
              decoration: const InputDecoration(
                labelText: 'Fullname',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            TextFormField(
              validator: (value) => value == '' ? "Dont Empty" : null,
              controller: _controllerUserName,
              decoration: const InputDecoration(
                labelText: 'Username',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: !_passwordVisible,
              validator: (value) => value == '' ? "Dont Empty" : null,
              controller: _controllerPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(
                      () {
                        _passwordVisible = !_passwordVisible;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buttonRegister() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(_controllerUserName.text);
            print(_controllerUserName.text);
          }
        },
        child: Text('Register'),
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20),
            primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
