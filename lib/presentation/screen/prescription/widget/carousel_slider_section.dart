import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sheba_ai/presentation/screen/prescription/widget/prescription_step.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          scrollDirection: Axis.vertical,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: [
          PrescriptionStep(
            stepNumber: "1",
            title: "Upload Prescription",
            subtitle: "Upload your prescription",
            animation: 'assets/anims/prescription.json',
            gradient: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
          ),
          PrescriptionStep(
            stepNumber: "2",
            title: "AI Analysis",
            subtitle: "Get instant analysis",
            animation: 'assets/anims/ai-analysis.json',
            gradient: [Color(0xFF3949AB), Color(0xFF5C6BC0)],
          ),
          PrescriptionStep(
            stepNumber: "3",
            title: "Buy Medicines",
            subtitle: "Get medicines delivered",
            animation: 'assets/anims/delivery.json',
            gradient: [Color(0xFF00897B), Color(0xFF26A69A)],
          ),
        ],
      ),
    );
  }
}
