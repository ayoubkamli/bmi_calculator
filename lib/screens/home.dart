import 'package:diary/constants/app_constants.dart';
import 'package:diary/screens/todo.dart';
import 'package:diary/widgets/left_bar.dart';
import 'package:diary/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _heightController =
      TextEditingController(text: '1.0');
  final TextEditingController _weightController =
      TextEditingController(text: '1.0');
  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 130,
                child: TextField(
                  autofocus: true,
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
                      color: Colors.white.withOpacity(.2),
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                      color: Colors.white.withOpacity(.2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              //
              if (_heightController.text.isNotEmpty ||
                  _weightController.text.isNotEmpty) {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = 'You\'re over weight';
                  } else if (_bmiResult >= 18.5) {
                    _textResult = 'You have normal weight';
                  } else {
                    _textResult = 'You\'re under weight';
                  }
                });
              }
            },
            child: Text(
              'Calculate',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            _bmiResult.toStringAsFixed(2),
            style: TextStyle(fontSize: 90, color: accentHexColor),
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Text(
              _textResult,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexColor),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const LeftBar(barWidth: 20),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 40),
          const SizedBox(
            height: 20,
          ),
          const LeftBar(barWidth: 20),
          const SizedBox(
            height: 30,
          ),
          const RightBar(barWidth: 40),
          GestureDetector(
            onTap: () {
              //
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TodoScreen()));
            },
            child: Text(
              'Tasks',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor),
            ),
          ),
          const RightBar(barWidth: 40),
        ]),
      ),
    );
  }
}
