import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            announcment(context);
          },
          child: Icon(
            Icons.announcement_sharp,
            color: accentHexColor,
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                },
                child: Icon(
                  Icons.refresh_outlined,
                  color: accentHexColor,
                  size: 30,
                ),
              )),
        ],
        title: Text(
          'BMI calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height',
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    )),
                Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weight',
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: Colors.white)),
                    )),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 79)),
                Text(
                  'CM',
                  style: TextStyle(color: accentHexColor, fontSize: 18),
                ),
                SizedBox(
                  width: 149,
                ),
                Text(
                  'KG',
                  style: TextStyle(color: accentHexColor, fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  // if (_bmiResult > 25) {
                  //   _textResult = "You are above the healthy range";
                  // } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  //   _textResult = "You are in healthy range";
                  // } else {
                  //   _textResult = "You are below the healthy range";
                  // }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SfRadialGauge(
              enableLoadingAnimation: true,
              axes: [
                RadialAxis(
                  minimum: 16.0,
                  maximum: 40.0,
                  radiusFactor: 0.8,
                  useRangeColorForAxis: true,
                  pointers: [
                    NeedlePointer(
                      needleColor: accentHexColor,
                      value: _bmiResult,
                      enableAnimation: true,
                    )
                  ],
                  ranges: [
                    GaugeRange(
                      startValue: 16.0,
                      endValue: 18.5,
                      color: Colors.blue,
                    ),
                    GaugeRange(
                      startValue: 18.5,
                      endValue: 25.0,
                      color: Colors.green,
                    ),
                    GaugeRange(
                      startValue: 25.0,
                      endValue: 40.0,
                      color: Colors.red,
                    ),
                  ],
                  annotations: [
                    GaugeAnnotation(
                      widget: Text(
                        'BMI',
                        style: TextStyle(fontSize: 16, color: accentHexColor),
                      ),
                      positionFactor: 0.5,
                      angle: 90,
                    )
                  ],
                )
              ],
            ),
            Container(
                child: Text(
              _bmiResult.toStringAsFixed(1),
              style: TextStyle(fontSize: 30, color: accentHexColor),
            )),
            // Visibility(
            //   visible: _textResult.isNotEmpty,
            //   child: Container(
            //       padding: EdgeInsets.all(10),
            //       child: RichText(
            //           text: TextSpan(children: [
            //         TextSpan(
            //           text: _textResult,
            //           style: TextStyle(
            //               fontSize: 22,
            //               fontWeight: FontWeight.w400,
            //               color: accentHexColor),
            //         )
            //       ]))),
            // ),
            Divider(
              color: Colors.white,
              height: 1.8,
            ),
            Container(
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Very Severely Underweight',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      '<16',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Severely Underweight',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      '16.0 - 16.9',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Underweight',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 164,
                    ),
                    Text(
                      '17.0 - 18.4',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Normal',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Text(
                      '18.5 - 24.9',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Overweight',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 173,
                    ),
                    Text(
                      '25.0 - 29.9',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Obese Class |',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 156,
                    ),
                    Text(
                      '30.0 - 34.9',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Obese Class ||',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 153,
                    ),
                    Text(
                      '35.0 - 39.9',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                  Row(children: [
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20)),
                    Text(
                      'Obese Class |||',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Text(
                      '>= 40.0',
                      style: TextStyle(fontSize: 16, color: accentHexColor),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void announcment(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              'Put " . " after the first index in height section , example: 1.76'),
        );
      });
}
