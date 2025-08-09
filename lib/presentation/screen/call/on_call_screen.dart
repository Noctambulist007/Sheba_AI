import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_ai/presentation/theme/color.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class OnCallScreen extends StatelessWidget {
  const OnCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 50 / 100,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset('assets/icons/ic-speaker.svg'),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RippleAnimation(
                    repeat: true,
                    color: AppColors.secondaryColour,
                    minRadius: 10,
                    maxRadius: 50,
                    duration: const Duration(milliseconds: 1000),
                    ripplesCount: 3,
                    child: SvgPicture.asset(
                      'assets/icons/ic-call.svg',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset('assets/icons/ic-unmute.svg'),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/on-call-service.svg',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Ringing...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: AppColors.grayscaleTextBody,
              ),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'On Call Service',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColors.grayscaleTextBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
