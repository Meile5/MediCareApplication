import 'package:flutter/material.dart';
class FutureAppointments extends StatelessWidget {
  const FutureAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              //border: Colors.blue, width: 2,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )],
            ),
            child:Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Dr. John Doe'),
                      Text('10:00 AM - 11:00 AM'),
                    ],
                  ),
                ),
                const SizedBox(width: 18),

                Expanded(
                  flex: 1,
                  child:Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),

                    ),
                        child: const Center(
                      child: Text('Status'),
                    ),
                  )
                ),

                const SizedBox(width: 18),

                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 40),
                    ),
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            )
          // Add more items
          )],
      ),
    );
  }
}
