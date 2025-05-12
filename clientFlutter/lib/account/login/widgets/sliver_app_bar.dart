import 'package:flutter/material.dart';

import '../../../common/utility/app_theme.dart';


typedef AsyncCallback = Future<void> Function();

class MySliverAppBar extends StatelessWidget {


  const MySliverAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: Colors.blueAccent,
      expandedHeight: 600.0,
      centerTitle: true,
      title: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            "My location",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Text(
            "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),

        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
        background: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

             // weatherAnimation,
              const SizedBox(height: 5),
              Text(
                "here",
               // weatherCode.description,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 5),

            ],
          ),
        ),
      ),
    );
  }

}


