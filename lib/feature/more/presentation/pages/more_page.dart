import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionhive/feature/more/presentation/pages/bluetooth_connection/bluetooth_connection_page.dart';
import 'package:package_info_plus/package_info_plus.dart'; // to Get Package Info

import 'package:ionhive/core/controllers/session_controller.dart'; // Session Controller
import 'package:ionhive/feature/auth/presentation/pages/login_page.dart'; // LogIN page

class MoreePage extends StatelessWidget {
  MoreePage({super.key});
  final sessionController = Get.find<SessionController>();

  void handleLogout() {
    Get.find<SessionController>().clearSession();
    Get.offAll(() => LoginPage());
  }

  // Fetch app version dynamically
  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme inside build method

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context, theme), // Pass context to _buildHeader
            const SizedBox(height: 20),
            _buildMainCard(theme),
            const SizedBox(height: 20),
            _buildManageAllCard(theme),
            const SizedBox(height: 20),
            _buildTripCard(theme),
            const SizedBox(height: 20),
            _buildNotificationCard(theme),
            const SizedBox(height: 20),
            _buildBluetoothDeviceCard(theme),
            const SizedBox(height: 20),
            _buildHelpandSupportcard(theme),
            const SizedBox(height: 20),
            _buildAccountManagementCard(theme),
            const SizedBox(height: 20),
            FutureBuilder<String>(
              future: _getAppVersion(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return _buildFooter(snapshot.data!);
                } else {
                  return _buildFooter('Unknown Version');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(String version) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Powered by Outdid \n Version $version',
              textAlign: TextAlign.center, // Center the text inside the Row
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

// Header with profile picture, user info, and edit icon
  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 228,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/banner/profile_banner.png"),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.grey[200],
                        child: Obx(() {
                          return Text(
                            sessionController.emailId.value[0].toUpperCase(),
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          );
                        }),
                      ),
                      CircularProgressIndicator(
                        value: 0.8,
                        strokeWidth: 6,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(theme.primaryColor),
                      ),
                      Positioned(
                        right: -5,
                        bottom: -5,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the Edit Profile page
                          },
                          child: CircleAvatar(
                            backgroundColor: theme.primaryColor,
                            radius: 15,
                            child: Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
          const SizedBox(height: 5),
          Obx(() {
            return Text(
              sessionController.emailId.value,
              style: TextStyle(
                fontSize: 14,
                color: theme.textTheme.bodyMedium?.color,
              ),
            );
          }),
          const SizedBox(height: 5),
          Text(
            "yet to be updated",
            style: TextStyle(
              fontSize: 14,
              color: theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }

// Main Card for Wallet and Session History
  Widget _buildMainCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCardOption(
                    Icons.account_balance_wallet, 'Wallet', '₹ 0.00', theme),
                const SizedBox(width: 16),
                _buildCardOption(Icons.history, 'Session', '0', theme),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Helper method for card options inside the main card
  Widget _buildCardOption(
      IconData icon, String title, String value, ThemeData theme) {
    return Expanded(
      child: GestureDetector(
        onTap: () {}, // Add navigation or functionality as needed
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: theme.primaryColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.titleLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        value,
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
      ),
    );
  }

// Manage All Card
  Widget _buildManageAllCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Manage',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.manage_history, color: theme.primaryColor),
                ],
              ),
              const SizedBox(height: 16),
              _buildMenuOption('Vehicle', Icons.directions_car, theme),
              _buildMenuOption('RFID', Icons.nfc, theme),
              _buildMenuOption('Devices', Icons.devices, theme),
            ],
          ),
        ),
      ),
    );
  }

// Manage Trip Card
  Widget _buildTripCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.map_outlined, color: theme.primaryColor),
                ],
              ),
              const SizedBox(height: 16),
              _buildMenuOption('Saved Trips', Icons.directions, theme),
            ],
          ),
        ),
      ),
    );
  }

// Manage Notifcations Card
  Widget _buildNotificationCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuOption('Notifications',
                  Icons.notification_important_outlined, theme),
            ],
          ),
        ),
      ),
    );
  }

// Manage Bluetooth Device Card
  Widget _buildBluetoothDeviceCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuOption(
                'Bluetooth connection',
                Icons.bluetooth_connected_outlined,
                theme,
                onTap: () {
                  // Navigate to the Bluetooth page
                  Get.to(() => BluetoothPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// Help & Support Card
  Widget _buildHelpandSupportcard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.live_help_outlined, color: theme.primaryColor),
                ],
              ),
              const SizedBox(height: 16),
              _buildMenuOption('Contact Us', Icons.contact_emergency, theme),
              _buildMenuOption(
                "FAQ's",
                Icons.question_answer_outlined,
                theme,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Account Management Card
  Widget _buildAccountManagementCard(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.manage_accounts, color: theme.primaryColor),
                ],
              ),
              const SizedBox(height: 16),
              _buildMenuOption('Account Privacy', Icons.lock, theme),
              _buildMenuOption(
                'Logout',
                Icons.exit_to_app,
                theme,
                titleColor: Colors.red, // Set logout text to red
                onTap: handleLogout,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Enhanced Menu Option
  Widget _buildMenuOption(
    String title,
    IconData icon,
    ThemeData theme, {
    VoidCallback? onTap,
    Color? titleColor,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: theme.primaryColor.withOpacity(0.2),
      highlightColor: theme.primaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: (titleColor ?? theme.primaryColor).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:
                  Icon(icon, color: titleColor ?? theme.primaryColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: titleColor ?? theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
