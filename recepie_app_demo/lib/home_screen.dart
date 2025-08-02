import 'package:flutter/material.dart';
import 'package:recepie_app_demo/model/recepie_model.dart';
import 'package:recepie_app_demo/recepie_detail.dart';
import 'package:recepie_app_demo/service/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<RecepieModel>> recepieFuture;
  @override
  void initState() {
    super.initState();
    recepieFuture = ApiService.instance.fetchModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recepies',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: FutureBuilder(
          future: recepieFuture, 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final recepies = snapshot.data!;
        
              return ListView.builder(
                itemCount: recepies.length,
                itemBuilder: (context, index) {
                  final recepie = recepies[index];
        
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecepieDetail(recepie:recepie),
                            ),
                          );
                        },
                        leading: Image.network(
                          recepie.image,
                          height: 50,
                          width: 50,
                        ),
                        title: Text(
                          recepie.name,
                          style: TextStyle(
                            
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text('~ ${recepie.cuisine}'),
                        trailing: Text(recepie.difficulty),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
