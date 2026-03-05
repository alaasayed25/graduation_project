import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;
  bool isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Register",
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.yellow,
                child: Icon(Icons.person, size: 50, color: Colors.black),
              ),

              const SizedBox(height: 30),

              buildTextField(
                controller: nameController,
                hint: "Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: emailController,
                hint: "Email",
                icon: Icons.email,
                isEmail: true,
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: passwordController,
                hint: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: confirmPasswordController,
                hint: "Confirm Password",
                icon: Icons.lock,
                isPassword: true,
                isConfirm: true,
              ),

              const SizedBox(height: 15),

              buildTextField(
                controller: phoneController,
                hint: "Phone Number",
                icon: Icons.phone,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : const Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have account? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("UI Working Successfully")),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isConfirm = false,
    bool isEmail = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword
          ? (isConfirm ? isConfirmPasswordHidden : isPasswordHidden)
          : false,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }

        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Enter valid email";
        }

        if (isPassword && value.length < 6) {
          return "Password must be at least 6 characters";
        }

        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.yellow),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            isConfirm
                ? (isConfirmPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility)
                : (isPasswordHidden
                ? Icons.visibility_off
                : Icons.visibility),
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (isConfirm) {
                isConfirmPasswordHidden = !isConfirmPasswordHidden;
              } else {
                isPasswordHidden = !isPasswordHidden;
              }
            });
          },
        )
            : null,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}