import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false));

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text("Welcome Back", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text("Enter your credential to login", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 60),
              _inputField("Username", Icons.person),
              const SizedBox(height: 15),
              _inputField("Password", Icons.lock, isPass: true),
              const SizedBox(height: 30),
              _fullButton("Login", Colors.purple, () {}),
              const SizedBox(height: 80),
              const Text("Forgot password?", style: TextStyle(color: Colors.purple)),
              const SizedBox(height: 20),
              _switchPage(context, "Don't have an account? ", "Sign Up", const SignupPage()),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Text("Sign up", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const Text("Create your account", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 40),
              _inputField("Username", Icons.person),
              const SizedBox(height: 10),
              _inputField("Email", Icons.email),
              const SizedBox(height: 10),
              _inputField("Password", Icons.lock, isPass: true),
              const SizedBox(height: 10),
              _inputField("Confirm Password", Icons.lock, isPass: true),
              const SizedBox(height: 30),
              _fullButton("Sign up", Colors.purple, () {}),
              const SizedBox(height: 20),
              const Text("Or"),
              const SizedBox(height: 20),
              _googleButton(),
              const SizedBox(height: 20),
              _switchPage(context, "Already have an account? ", "Login", const LoginPage()),
            ],
          ),
        ),
      ),
    );
  }
}

// STYLED COMPONENTS
Widget _inputField(String hint, IconData icon, {bool isPass = false}) => TextField(
  obscureText: isPass,
  decoration: InputDecoration(
    hintText: hint, prefixIcon: Icon(icon), filled: true,
    fillColor: const Color(0xFFF1E6FF),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
  ),
);

Widget _fullButton(String txt, Color col, VoidCallback act) => SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: act,
    style: ElevatedButton.styleFrom(backgroundColor: col, shape: const StadiumBorder(), padding: const EdgeInsets.symmetric(vertical: 16)),
    child: Text(txt, style: const TextStyle(color: Colors.white, fontSize: 18)),
  ),
);

Widget _googleButton() => SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(shape: const StadiumBorder(), side: const BorderSide(color: Colors.purple), padding: const EdgeInsets.symmetric(vertical: 16)),
    child: const Text("Sign In with Google", style: TextStyle(color: Colors.purple)),
  ),
);

Widget _switchPage(BuildContext ctx, String t1, String t2, Widget page) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(t1),
    TextButton(onPressed: () => Navigator.push(ctx, MaterialPageRoute(builder: (c) => page)), child: Text(t2, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)))
  ],
);
