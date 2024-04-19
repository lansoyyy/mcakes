import 'package:flutter/material.dart';

import 'text_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.pink[400],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: 'MCakes',
                fontSize: 75,
                color: Colors.white,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 30,
              ),
              TextWidget(
                text: '09610324520',
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: 'Kisolon, Sumilao Bukidnon',
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Medium',
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'PRIVACY POLICY',
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'TERMS OF USE',
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Bold',
              ),
              const SizedBox(
                height: 50,
              ),
              TextWidget(
                text: '2024 Design by MCakes',
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Regular',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
