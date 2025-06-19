import 'package:flutter/material.dart';

class CustomMarkerWidget extends StatelessWidget {
  final String networkImageUrl;
  const CustomMarkerWidget({super.key, required this.networkImageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/Pin_current_location.png', width: 100, height: 100),
        CircleAvatar(
          backgroundImage: NetworkImage(networkImageUrl),
          radius: 25,
        ),
      ],
    );
  }
}
