import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheatherapp/screens/sign_up.dart';

import '../providers/registeration_provider.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registrationProviderObject = context.read<RegistrationProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  child: Image.network(
                    "https://miro.medium.com/v2/resize:fit:1100/format:webp/1*nlSy3ZCCbdUXFRH4Q1zstg.png",
                  ),
                ),
                SizedBox(height: 100),
                CustomTextFormField(
                  controller: emailController,
                  label: "Email",
                  suffixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 50),
                CustomTextFormField(
                  obscureText: true,
                  controller: passwordController,
                  label: "Password",
                  suffixIcon: Icon(Icons.password),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final success = await registrationProviderObject
                          .loginDataProvider(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            registrationProviderObject
                                    .registrationModel
                                    ?.message ??
                                'Please try again',
                          ),
                          backgroundColor: success
                              ? Colors.green
                              : Colors.deepOrange,
                        ),
                      );

                      if (success) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WeatherPage(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
