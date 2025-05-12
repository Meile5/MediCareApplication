import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class MessageDisplay extends StatelessWidget{
  final String message;

  const MessageDisplay(
      {super.key, required this.message});

  final String animationEmpty = 'https://lottie.host/d6872b61-0888-460f-b77b-c99cfde00602/8sjSztLhTt.json';


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Lottie animation
          SizedBox(
            height: 200,
            child: Lottie.network(animationEmpty),
          ),
          const SizedBox(height: 20),
          Text(message),
        ],
      ),
    );
  }

}