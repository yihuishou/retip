import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SettingsView'),
        actions: [
          if (kReleaseMode == false) ...[
            IconButton(
              onPressed: () {
                context.push('/logger');
              },
              icon: Icon(Icons.troubleshoot),
            ),
            IconButton(
              onPressed: () {
                context.push('/dev');
              },
              icon: Icon(Icons.developer_board),
            ),
          ],
        ],
      ),
    );
  }
}
