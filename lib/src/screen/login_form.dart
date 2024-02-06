import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapistschedules/src/screen/therapist_schedules_screens.dart';

import '../bloc/auth_bloc.dart:.dart';
// Import the therapist schedules screen

class LoginForm extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Logging in...")));
          } else if (state is AuthSuccess) {
            // Navigate to therapist schedules screen on successful login
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TherapistSchedulesScreen()),
            );
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            // appBar: AppBar(title: Text('Login')),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Container(
                      height: 98.8,
                      width: 280,
                      child: Image.asset(
                          'assets/image/clinic-management-software.png'),
                    ),
                    SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.only(right: 280),
                      child: Text("Username",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: userIdController,
                      decoration: InputDecoration(
                        labelText: 'Enter your username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(right: 280),
                      child: Text("Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ),
                    SizedBox(height: 23),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Enter your Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF62C55E),
                            Color(0xFF62C55E),
                            Color(0xFF6DA52D),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                  userId: userIdController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(
                          width: 89,
                        ),
                        const Text(
                          'Unable to Login ?',
                          style: TextStyle(
                            color: Color(0xFF164E63),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Add your "Contact Us" functionality here
                          },
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Color(0xFF164E63),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
