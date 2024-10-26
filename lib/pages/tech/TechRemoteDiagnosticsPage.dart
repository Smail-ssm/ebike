import 'package:flutter/material.dart';

import '../../model/client.dart';
import '../../model/vehicule.dart';
import '../VehicleDetailPage.dart';

class TechRemoteDiagnosticsPage extends StatefulWidget {
  final Client client;
  final List<Vehicle> vehicles;

  TechRemoteDiagnosticsPage({required this.client, required this.vehicles});

  @override
  _TechRemoteDiagnosticsPageState createState() =>
      _TechRemoteDiagnosticsPageState();
}

class _TechRemoteDiagnosticsPageState extends State<TechRemoteDiagnosticsPage> {
  TextEditingController _searchController = TextEditingController();
  List<Vehicle> _filteredVehicles = [];

  @override
  void initState() {
    super.initState();
    _filteredVehicles = widget.vehicles;
    _searchController.addListener(_filterVehicles);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterVehicles);
    _searchController.dispose();
    super.dispose();
  }

  void _filterVehicles() {
    String searchQuery = _searchController.text.toLowerCase();
    setState(() {
      _filteredVehicles = widget.vehicles
          .where((vehicle) => vehicle.id.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by Vehicle ID',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredVehicles.isEmpty
                ? Center(child: Text('No vehicles available.'))
                : ListView.builder(
                    itemCount: _filteredVehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = _filteredVehicles[index];
                      return VehicleCard(
                        vehicle: vehicle,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VehicleDetailPage(
                                vehicle: vehicle,
                                userRole: "tech",
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final VoidCallback onTap;

  VehicleCard({required this.vehicle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                vehicle.model.toLowerCase().contains('bike')
                    ? Icons.pedal_bike
                    : Icons.electric_scooter,
                size: 48.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.model ?? 'Unknown Model',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('ID: ${vehicle.id}'),
                    SizedBox(height: 4.0),
                    Text('Battery Level: ${vehicle.battery.level ?? 'N/A'}%'),
                  ],
                ),
              ),
              vehicle.isAvailable
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
