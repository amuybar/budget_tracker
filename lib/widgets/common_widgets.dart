import 'package:flutter/material.dart';

class CommonWidgets {
  // Text widget with custom styling
  static Widget customText(String text, {required TextStyle style}) {
    return Text(
      text,
      style: style, // Apply custom style if provided
    );
  }

  // Custom button widget
  static Widget customButton({
    required String text,
    required VoidCallback onPressed,
    Color color = Colors.blue,
    Color textColor = Colors.white,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
      ),
      child: Text(text),
    );
  }

  // Custom icon widget
  static Widget customIcon(IconData icon,
      {Color color = Colors.black, double size = 24.0}) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }

  // Custom card widget
  static Widget customCard({
    required String title,
    required Color color,
    required String route,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Custom container widget
  static Widget customContainer(
      {required Widget child,
      required EdgeInsetsGeometry padding,
      Color color = Colors.transparent}) {
    return Container(
      padding: padding,
      color: color,
      child: child,
    );
  }

  // Custom text form field widget
  static Widget customTextFormField({
    required String labelText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Function(String)? onChanged,
    String Function(String?)? validator,
  }) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
        decorationStyle: TextDecorationStyle.solid,
        decorationColor: Colors.black,
        decorationThickness: 1.0,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 73, 50, 16)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 42, 42)),
        ),
        hintText: labelText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 252, 0, 0)),
        fillColor: const Color.fromARGB(255, 255, 255, 255),
        filled: true,
        contentPadding: const EdgeInsets.all(16.0),
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
