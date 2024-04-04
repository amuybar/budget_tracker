import 'package:flutter/material.dart';
import 'package:myapp/services/supabase_service.dart';
import 'package:myapp/widgets/common_widgets.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final SupabaseManager _supabaseManager = SupabaseManager();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String err = '';
  void _register() async {
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

        // Navigate to login page upon successful registration
        Navigator.pop(context);
      } catch (error) {
        err = error.toString();
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create an Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CommonWidgets.customTextFormField(
                  labelText: 'Email',
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
                Text(err),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : CommonWidgets.customButton(
                        text: 'Register',
                        onPressed: _register,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
