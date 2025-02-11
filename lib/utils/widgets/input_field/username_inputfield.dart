import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsernameInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const UsernameInputField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(
            r'^[a-zA-Z0-9_. ]*$')), // ✅ Allow letters, numbers, underscore, dot, and spaces
        LengthLimitingTextInputFormatter(20), // Max 20 characters
      ],
      keyboardType: TextInputType.name,
      style: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 16,
        color: theme.colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.7),
        ),
        prefixIcon: Icon(
          Icons.person_outline,
          color: theme.primaryColor,
        ),
        hintText: 'Enter your username',
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.5),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: theme.colorScheme.onSurface.withOpacity(0.3),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
      onChanged: (value) => onChanged?.call(value),
    );
  }
}
