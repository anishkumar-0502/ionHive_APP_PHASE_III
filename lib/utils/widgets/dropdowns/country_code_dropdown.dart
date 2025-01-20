import 'package:flutter/material.dart';

class CountryCodeDropdown extends StatelessWidget {
  final String selectedCountryCode;
  final ValueChanged<String?> onChanged;

  const CountryCodeDropdown({
    super.key,
    required this.selectedCountryCode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? Colors.white70 // Border color for dark mode
              : Colors.grey, // Border color for light mode
        ),
        borderRadius: BorderRadius.circular(12),
        color: theme.brightness == Brightness.light
            ? Colors.grey.shade100
            : Colors.grey.shade700, // Adjust based on theme
      ),
      child: DropdownButton<String?>(
        value: selectedCountryCode,
        items: [
          "+91", // India
          "+1", // USA
          "+44", // UK
          "+61", // Australia
        ].map((code) {
          return DropdownMenuItem<String?>(
            value: code,
            child: Text(
              code,
              style: theme.textTheme.bodyMedium,
            ),
          );
        }).toList(),
        onChanged: onChanged,
        underline: const SizedBox(), // Remove the default underline

        icon: Icon(
          Icons.arrow_drop_down,
          color: theme.primaryColor, // Dropdown icon color from the theme
        ),
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
