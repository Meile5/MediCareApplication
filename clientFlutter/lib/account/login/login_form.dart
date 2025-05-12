import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:medicare/common/widgets_shared/general_button.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  final String  loginAnimation = "https://lottie.host/1446b2af-800c-4d48-9551-28e867657db6/NGTZZHjlm3.json";

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoggedIn) {
          // Navigate to next screen
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// Top Box hidden when keyboard is open
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isKeyboardVisible ? 0 : 300,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),

                              const Text(
                                'Welcome to MediCare',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),

                              SizedBox(
                                height: 200,
                                child: Lottie.network(loginAnimation),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),


                     Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: Column(
                         children: [
                           SizedBox(
                             width: double.infinity, // Makes the box full width
                             child: Align(
                               alignment: Alignment.centerLeft,
                               child: Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                             ),
                           ),
                           const SizedBox(height: 6),
                           TextFormField(

                             controller: _emailController,
                             decoration: const InputDecoration(
                                 labelText: 'Enter your email',
                             prefixIcon: Padding(
                               padding: EdgeInsets.all(10),
                               child: FaIcon(FontAwesomeIcons.envelope, color: Colors.blueAccent,),
                             )),
                             keyboardType: TextInputType.emailAddress,
                           ),
                           const SizedBox(height: 16),
                           SizedBox(
                             width: double.infinity,
                             child: Align(
                               alignment: Alignment.centerLeft,
                               child: Text("Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                             ),
                           ),
                           const SizedBox(height: 6),
                           TextFormField(
                             controller: _passwordController,
                             obscureText: true,
                             decoration: const InputDecoration(
                                 labelText: 'Enter your password',
                                 prefixIcon: Padding(
                                   padding: EdgeInsets.all(10),
                                   child: FaIcon(Icons.lock, color: Colors.blueAccent,),
                                 )),),

                           const SizedBox(height: 24),

                           GeneralButton(
                             label: "Log In",
                             onPressed: state is LoginLoading ? null : _login,
                             isLoading: state is LoginLoading,
                           ),

                         ],
                       ),
                     ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

}