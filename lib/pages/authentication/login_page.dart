import 'package:flutter/material.dart';
import 'package:myapp/services/supabase_service.dart';

import 'package:myapp/widgets/common_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseManager _supabaseManager = SupabaseManager();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _login() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    try {
      await _supabaseManager.signInUser(
        context,
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to home page or desired screen upon successful login
      Navigator.pushNamed(context, '/home');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.customContainer(child: Image.asset('assets/logo.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                ),
                
                padding: EdgeInsets.all(10.0)),
                const Text(
                  'Budget Tracker',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CommonWidgets.customTextFormField(
                  labelText: 'Username or Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return '';
                  },
                ),
                const SizedBox(height: 10),
                CommonWidgets.customTextFormField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return '';
                  },
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : CommonWidgets.customButton(
                        text: 'Login',
                        onPressed: _login,
                      ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'New user? Register here',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Add reset password logic
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
