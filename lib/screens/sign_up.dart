import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/registeration_provider.dart';
import '../widgets/custom_text_field.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController textdController = TextEditingController();

  SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var registrationProviderObject =
        Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Signup",
            style: TextStyle(fontSize: 24),
          ),
        ),

      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
                controller: nameController,
                label: "User Name",
                suffixIcon: Icon(Icons.person),
                ),
            CustomTextFormField(
                controller: phoneController,
                label: "Phone",
                suffixIcon: Icon(Icons.phone),
                ),
            CustomTextFormField(
              controller: emailController,
              label: "Email",
              suffixIcon: Icon(Icons.email),

            ),
            CustomTextFormField(
              controller: passwordController,
              label: "Password",
              suffixIcon: Icon(Icons.lock),
              obscureText: true,

            ),

            const SizedBox(height: 10),
            // Signup button
            TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await registrationProviderObject.signUpDataProvider(
                        email: emailController.text,
                        password: passwordController.text,
                      name: nameController.text,
                      phone: phoneController.text,

                    );
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(registrationProviderObject
                      .registrationModel!.message)));
                  if (registrationProviderObject.registrationModel?.status ==
                      true) {
                    print(registrationProviderObject
                        .registrationModel?.message);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  }
                },
                child: Text("Sign Up")),
            // Already have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),)) ;                },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
