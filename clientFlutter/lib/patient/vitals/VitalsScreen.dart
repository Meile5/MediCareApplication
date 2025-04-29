import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});
  //small change
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vitals', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            _buildVitalsCard(Icons.thermostat_outlined, 'Temperature'),
            _buildVitalsCard(FontAwesomeIcons.heartbeat, 'Heart Rate'),
            _buildVitalsCard(FontAwesomeIcons.lungs, 'Blood Oxygen'),
            _buildVitalsCard(FontAwesomeIcons.lightbulb, 'ECG'),
          ],
        ),
      ),
    );
  }

  Widget _buildVitalsCard(IconData icon, String label) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          //to handel taps later
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 50.0, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
