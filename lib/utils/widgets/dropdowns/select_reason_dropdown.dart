import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectReasonDropdown extends StatelessWidget {
  final List<String> reasons;
  final RxString selectedReason;

  const SelectReasonDropdown({
    super.key,
    required this.reasons,
    required this.selectedReason,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Reason for Deletion',
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSecondary,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        filled: true,
        fillColor: theme.colorScheme.surface,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(
          () {
            return DropdownButton<String>(
              isExpanded: true,
              value: selectedReason.value.isEmpty ? null : selectedReason.value,
              hint: const Text("Select Reason"),
              items: reasons.map((reason) {
                return DropdownMenuItem<String>(
                  value: reason,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.dividerColor,
                        width: 1,
                      ),
                      color: selectedReason.value == reason
                          ? theme.colorScheme.primary.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          // Optional Icon - you can use any icons or remove this
                          Icon(
                            Icons.check_circle,
                            size: 18,
                            color: selectedReason.value == reason
                                ? theme.primaryColor
                                : theme.colorScheme.onSurface.withOpacity(0.7),
                          ),
                          const SizedBox(width: 10),
                          // Reason Text wrapped in Expanded to avoid overflow
                          Expanded(
                            child: Text(
                              reason,
                              style: TextStyle(
                                fontSize: 16,
                                color: selectedReason.value == reason
                                    ? theme.primaryColor
                                    : theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow:
                                  TextOverflow.ellipsis, // Truncate long text
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                selectedReason.value = value ?? '';
              },
              iconSize: 30,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  selectedReason.value.isEmpty
                      ? Icons.arrow_drop_down
                      : Icons.check_circle,
                  key: ValueKey(selectedReason.value),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
