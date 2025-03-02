import 'package:ebike/model/vehicule.dart';
import 'package:flutter/material.dart';
import '../../model/client.dart';
import '../../pages/ClientProfilePage.dart';

import '../../pages/tech/TechPerformanceMetricsPage .dart';
import '../../pages/tech/TechRemoteDiagnosticsPage.dart';
import '../../pages/tech/TechWorkOrderManagementPage.dart';
import '../UserAccountsDrawerHeaderWidget.dart';

class TechLeftDrawer extends StatelessWidget {
  final Client client;
  final VoidCallback onLogout;
  final List<Vehicle> vehicles; // Pass vehicles if required

  const TechLeftDrawer({
    Key? key,
    required this.client,
    required this.onLogout,
    required this.vehicles,
  }) : super(key: key);

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, VoidCallback onTap, {String? value}) {
    return ListTile(
      title: Text(title),
      subtitle: value != null ? Text(value) : null,
      leading: Icon(icon),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeaderWidget(
            client: client,
            onLogout: onLogout,
          ),
          // Work Section
          _buildSectionHeader('Work'),
          buildListTile(
            'Work Order Management',
            Icons.assignment,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TechWorkOrderManagementPage(client: client)),
              );
            },
          ),
          buildListTile(
            'Remote Diagnostics',
            Icons.phonelink_setup,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TechRemoteDiagnosticsPage(
                        client: client, vehicles: vehicles)),
              );
            },
          ),

          const Divider(),

          // Monitoring Section
          _buildSectionHeader('Monitoring'),
          buildListTile(
            'Performance Metrics',
            Icons.bar_chart,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TechPerformanceMetricsPage(client: client)),
              );
            },
          ),

          const Divider(),

          // Account Section
          _buildSectionHeader('Account'),
          buildListTile(
            'Profile',
            Icons.person,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClientProfilePage(client: client)),
              );
            },
          ),
        ],
      ),
    );
  }
}
