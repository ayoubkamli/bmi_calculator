import 'package:diary/constants/app_constants.dart';
import 'package:diary/widgets/left_bar.dart';
import 'package:diary/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                child: TextFormField(
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
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentHexColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Wight',
                    hintStyle: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
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
          Container(
            child: Text(
              '10',
              style: TextStyle(fontSize: 90, color: accentHexColor),
            ),
          ),
          Container(
            child: Text(
              'Normal weight',
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
          const SizedBox(
            height: 40,
          ),
          const RightBar(barWidth: 40),
        ]),
      ),
    );
  }
}
