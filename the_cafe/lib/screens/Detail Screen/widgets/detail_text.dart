import 'package:flutter/material.dart';
import 'package:the_cafe/constants.dart';
import 'package:the_cafe/size_config.dart';

class detailText extends StatelessWidget {
  const detailText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem lpsum is that it has a more-or-less normal distribution of letters, as oppesed.',
          ),
          Title('Time'),
          //Spacer(),
          Row(
            children: [
              TextBox('12:00 AM', 80),
              Text('  -  '),
              TextBox('12:00 PM', 80),
            ],
          ),
          Title('Date'),
          TextBox('Sep, 10, 2023', 100),
          Title('Facilities'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityItem(
                str1: 'assets/Vector-14.png',
                str2: ' Size',
                str3: '1190 Sft',
              ),
              FacilityItem(
                str1: 'assets/Vector-14.png',
                str2: ' Size',
                str3: '1190 Sft',
              ),
              FacilityItem(
                str1: 'assets/Vector-14.png',
                str2: ' Size',
                str3: '1190 Sft',
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding Title(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Container TextBox(String text, double width) {
    return Container(
      height: getProportionateScreenHeight(30),
      width: getProportionateScreenWidth(width),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: textfieldColor, width: 1),
      ),
      child: Center(
        child: Text(
          text,
        ),
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  const FacilityItem({
    super.key,
    required this.str1,
    required this.str2,
    required this.str3,
  });

  final String str1;
  final String str2;
  final String str3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth / 3 - 20,
      height: getProportionateScreenHeight(80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(width: 1, color: textfieldColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                str1,
                color: textfieldColor,
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                child: Text(
                  str2,
                  style: TextStyle(color: textfieldColor, fontSize: 12),
                ),
              )
            ],
          ),
          Text(str3),
        ],
      ),
    );
  }
}
