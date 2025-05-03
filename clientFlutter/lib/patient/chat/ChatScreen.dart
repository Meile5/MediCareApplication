import 'package:flutter/material.dart';

import '../common/app_nav_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Chat Screen', style: TextStyle(fontSize: 24)),
      bottomNavigationBar: AppNavBar(),
    );
  }
}
