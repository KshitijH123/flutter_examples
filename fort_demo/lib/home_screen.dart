import 'package:flutter/material.dart';
import 'package:fort_demo/api_service.dart';
import 'package:fort_demo/fort_detail_screen.dart';
import 'package:fort_demo/model/fort_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FortModel>> fortsFuture;

  @override
  void initState() {
    super.initState();
    fortsFuture = ApiService.instance.fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forts Info',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        elevation: 2,
        centerTitle: true,
      ),
      body: FutureBuilder<List<FortModel>>(
        future: fortsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No Data Found'));
          } else {
            final forts = snapshot.data!;

            return ListView.builder(
              itemCount: forts.length,
              itemBuilder: (context, index) {
                final fort = forts[index];

                return Card(
                  child: ListTile(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FortDetailScreen(fort: fort))),
                    leading: Icon(Icons.fort),
                    title: Text(fort.name,style: TextStyle(fontSize: 18),),
                    subtitle: Text(fort.location),
                    trailing: Text('${fort.distance} km'),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
