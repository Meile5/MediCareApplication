import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/common/auth/auth_cubit.dart';

import 'login_cubit.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginPage());
  }

  final String doctorPhoneAnimation =
      "https://lottie.host/2dafffe9-308f-4de4-9303-73c8fba919ea/JFgn8pkSn0.json";
  final String bookingAnimation =
      "https://lottie.host/624596f3-25ca-4910-b2bd-b51af68dc4b6/I3smAxcsZw.json";
  final String monitorAnimation =
      "https://lottie.host/737bbad6-4835-4e73-8278-98abee0eb194/BZj0UeRUip.json";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthCubit>()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 800;
          return Scaffold(
            body:
                isWide
                    ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24.0,
                                vertical: 40,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: const [
                                      SizedBox(height: 32),
                                      Text(
                                        "MediCare",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 58,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),

                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      _StylishFeatureCard(
                                        animationUrl: doctorPhoneAnimation,
                                        label: "Instant Communication",
                                      ),
                                      _StylishFeatureCard(
                                        animationUrl: bookingAnimation,
                                        label: "Appointment Management",
                                      ),
                                      _StylishFeatureCard(
                                        animationUrl: monitorAnimation,
                                        label: "Remote Health Monitoring",
                                      ),
                                    ],
                                  ),

                                  const Padding(
                                    padding: EdgeInsets.only(top: 16.0),
                                    child: Text(
                                      "Your health, our priority.\nWelcome to the future of care.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 3, child: Center(child: LoginForm())),
                      ],
                    )
                    : Center(child: LoginForm()),
          );
        },
      ),
    );
  }
}

class _StylishFeatureCard extends StatefulWidget {
  final String animationUrl;
  final String label;

  const _StylishFeatureCard({
    required this.animationUrl,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  State<_StylishFeatureCard> createState() => _StylishFeatureCardState();
}

class _StylishFeatureCardState extends State<_StylishFeatureCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Lottie.network(
              widget.animationUrl,
              controller: _controller,
              fit: BoxFit.contain,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..repeat();
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
