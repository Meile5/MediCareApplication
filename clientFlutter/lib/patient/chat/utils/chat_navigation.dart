import 'package:flutter/material.dart';

class ChatNavigation extends StatelessWidget {
  const ChatNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.blueAccent.withAlpha(80),
      ),
      child: const TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        tabs: [Tab(text: 'Future'), Tab(text: 'Past')],
      ),
    );
  }
}
