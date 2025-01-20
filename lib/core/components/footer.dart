import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function(int) onTabChanged;
  final int currentIndex;

  const Footer({
    super.key,
    required this.onTabChanged,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get the current theme

    return BottomNavigationBar(
      currentIndex: currentIndex, // Highlight the selected tab
      onTap: onTabChanged, // Call onTabChanged when a tab is clicked
      selectedItemColor: theme.primaryColor, // Use the theme's primary color
      unselectedItemColor: theme.iconTheme.color, // Use unselected icon color
      backgroundColor: theme.scaffoldBackgroundColor, // Match the theme
      elevation: 0, // Remove shadow effect
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Trip',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz_sharp),
          label: 'More',
        ),
      ],
    );
  }
}
