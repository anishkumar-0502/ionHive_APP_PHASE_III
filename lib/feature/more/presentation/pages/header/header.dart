import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have GetX imported for Get.find() and Get.offAll()
import 'package:ionhive/core/controllers/session_controller.dart';

class HeaderCard extends StatelessWidget {
  final ThemeData theme;

  HeaderCard({super.key, required this.theme});
  final sessionController = Get.find<SessionController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor, // Theme-based background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile avatar with edit button
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.cardColor, // Theme-based color
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor:
                          theme.primaryColorLight, // Theme-based background
                      child: Obx(() {
                        return Text(
                          sessionController.emailId.value[0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.bodyLarge
                                ?.color, // Theme-based text color
                          ),
                        );
                      }),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the Edit Profile page
                      },
                      child: CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 16,
                        child: Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16), // Spacing between avatar and details
              // Column with email, username, and status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Text(
                        sessionController.username.value,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.headlineSmall?.color,
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    Obx(() {
                      return Text(
                        sessionController.emailId.value,
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
                    Text(
                      "Status: Active",
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
