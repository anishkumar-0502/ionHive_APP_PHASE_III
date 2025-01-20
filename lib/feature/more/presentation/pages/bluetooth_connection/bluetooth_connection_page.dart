import 'package:flutter/material.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Connection'),
      ),
      body: Center(
        child: const Text('This is the Bluetooth Connection page'),
      ),
    );
  }
}
