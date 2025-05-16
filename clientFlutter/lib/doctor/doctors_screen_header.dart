import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsScreenHeader extends StatelessWidget {
  const DoctorsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              SizedBox(width: 30),
              FaIcon(FontAwesomeIcons.userDoctor, color: Colors.blueAccent, size: 25),
              SizedBox(width: 12),
              Text(
                'MediCare',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Dr. Smith',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              SizedBox(width: 30),

            ],
          ),

        ],
      ),
    );
  }
}
