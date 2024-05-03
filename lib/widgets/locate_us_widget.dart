import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:mcakes/widgets/text_widget.dart';
import 'package:latlong2/latlong.dart';

class LocateUsWidget extends StatelessWidget {
  const LocateUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: TextWidget(
            text: 'LOCATE US',
            fontSize: 32,
            fontFamily: 'Bold',
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/Capture.PNG',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
