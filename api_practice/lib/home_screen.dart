import 'package:api_practice/model/quote.dart';
import 'package:api_practice/service/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Quote>?> quoteFuture;

  @override
  void initState() {
    super.initState();
    quoteFuture = ApiServices.instance.fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quotes",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
      elevation: 2,
      ),
      body: FutureBuilder<List<Quote>?>(
        future: quoteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No quotes available'));
          } else {
            final quotes = snapshot.data!;

            return ListView.builder(
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                final quote = quotes[index];

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  shadowColor: Colors.blueGrey,
                  child: ListTile(
                    title: Text(
                      quote.quote,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    subtitle: Text('- ${quote.author}'),
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
