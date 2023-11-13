import 'package:calculator/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'welcome to my zivs calculator',
      theme: ThemeData(primaryColor: Colors.pinkAccent),
      home: splashscreen(),
    );
  }
}

class myhomepage extends StatefulWidget {
  const myhomepage({super.key});

  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  var _operation = ['Add', 'Subtract', 'Multiply', 'Divide'];
  var _values = 'Add';
  var _displaytext = '';
  var textbox1 = TextEditingController();
  var textbox2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('ZIVS CALCUALTOR')),
        ),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: ListView(children: [
            // First Item
            DropdownButton<String>(
              value: _values,
              items: _operation.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _values = value.toString();
                  print("Value changed to $value");
                });
              },
            ),

            //taking the first input number
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            TextField(
              controller: textbox1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "First Number",
                  hintText: "100",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 5),
            ),
            //Taking the second input of the number
            TextField(
              controller: textbox2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Second Number",
                  hintText: "13",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Text(
              _displaytext,
              style: const TextStyle(fontSize: 20),
            ),
            //third number
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: const Text(
                      'Calculate',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    onPressed: () {
                      setState(() {
                        if (textbox1 != '' && textbox2 != '') {
                          double first = double.parse(textbox1.text);
                          double second = double.parse(textbox2.text);
                          switch (_values) {
                            case 'Add':
                              {
                                var sum = first + second;
                                _displaytext =
                                    "The sum is ${sum.toStringAsFixed(0)}";
                                break;
                              }
                            case 'Subtract':
                              {
                                var sub = first - second;
                                _displaytext =
                                    "The difference is ${sub.toStringAsFixed(0)}";
                                break;
                              }
                            case 'Multiply':
                              {
                                var mul = first * second;
                                _displaytext =
                                    "The product is ${mul.toStringAsFixed(0)}";
                                break;
                              }
                            case 'Divide':
                              {
                                double div = first / second;
                                _displaytext =
                                    "The division is ${div.toStringAsFixed(0)}";
                                break;
                              }
                            default:
                              _displaytext = 'something went wrong';
                          }
                        } else {
                          _displaytext = 'please fill all section';
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                    child: ElevatedButton(
                  child: const Text(
                    'clear',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setState(() {
                      _clearall();
                    });
                  },
                ))
              ],
            ),
          ]),
        ));
  }

  void _clearall() {
    textbox1.text = '';
    textbox2.text = '';
    _displaytext = 'cleared!!!';
  }

  void _calculateresult(value) {}
}
