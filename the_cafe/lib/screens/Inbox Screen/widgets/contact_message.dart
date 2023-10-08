import 'package:flutter/material.dart';
import 'package:the_cafe/screens/Inbox%20Screen/widgets/inbox_image.dart';
import 'package:the_cafe/size_config.dart';

class ContactMessage extends StatelessWidget {
  const ContactMessage({
    super.key,
    required this.name,
    required this.message,
    required this.icon,
    this.ImageURL,
  });

  final String name;
  final String message;
  final Icon icon;
  final ImageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(10),
              top: getProportionateScreenWidth(10),
            ),
            child: InboxImage(
              ImageURL: ImageURL,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Center(
                      child: Text(
                        '12:30 AM',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    icon,
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
