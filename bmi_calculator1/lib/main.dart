import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        // primaryColor: Colors.red,
        scaffoldBackgroundColor: Color(0xFF0A0D22),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(
        //   backgroundColor: Color(0xFFEB1555),
        // ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF080A1C),
          // color: Color(0xFF1D1F33),
        ),
        // accentColor: Colors.white,
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(color: Colors.white),
        //   headline1: TextStyle(
        //       color: Colors.white, fontSize: 22, fontFamily: 'Pacificso'),
        // ),
        // // scaffoldBackgroundColor: Colors.orange[100],
        // // splashColor: Colors.black, //kch pta nhi kya kr rha ye
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.orange,
        //   // primaryColorDark: Colors.white,
        //   // accentColor: Colors.cyan,
        //   // cardColor: Colors.teal,
        //   // errorColor: Colors.black,
        // ),
        //   // textTheme: GoogleFonts.emilysCandyTextTheme(),
      ),
      home: InputPage(),
    );
  }
}
