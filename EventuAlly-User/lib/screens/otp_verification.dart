import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/constant.dart';
import '../widget/heading.dart';
import '../widget/logo.dart';
import '../widget/numberfield.dart';
import '../widget/subheading.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  Container buildOTPFields(int index, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.12,
      margin: EdgeInsets.fromLTRB(width * 0.02, height * 0.03, 0.0, 0.0),
      child: Center(
        child: numberField(title: ' ', maxLength: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFAFAFA),
        body: Container(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.fromLTRB(0.0, height * 0.04, 0.0, 0.0),
                child: logo(width: width * 0.9, height: height * 0.15),
              ),
              heading(
                title: 'Verification',
                heightFromTop: height * 0.008,
                fontSize: width * 0.11,
              ),
              subHeading(
                title: "Verify your Account",
                fontSize: width * 0.04,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, height * 0.04, 0.0, 0.0),
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFCB585A),
                    fontSize: width * 0.08,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, height * 0.08),
                child: Text(
                  'Enter the OTP code we just sent ',
                  style: TextStyle(
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF555555),
                    fontSize: width * 0.04,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Text(
                  ' you on your registered Email.',
                  style: TextStyle(
                    fontFamily: constant.font,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF555555),
                    fontSize: width * 0.04,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                  (index) => buildOTPFields(index, context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}