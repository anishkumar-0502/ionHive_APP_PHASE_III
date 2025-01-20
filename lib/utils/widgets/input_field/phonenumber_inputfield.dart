import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberInput({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme

    return TextField(
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10), // Allow max 10 digits
      ],
      keyboardType: TextInputType.phone,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 16, // Override font size if necessary
        color: theme.colorScheme.onSurface, // Use the theme's onSurface color
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: theme.primaryColor, // Use the theme's primary color for the icon
        ),
        hintText: 'Enter your phone number',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.5), // Lighter hint color
        ),
        filled: true,
        fillColor: theme.brightness == Brightness.light
            ? Colors.grey.shade100
            : Colors.grey.shade700, // Adjust based on theme
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), // Rounded input field
          borderSide: BorderSide.none, // No default border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.colorScheme.onSurface.withOpacity(0.3), // Subtle border color
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
    );
  }
}
