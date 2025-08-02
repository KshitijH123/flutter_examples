import 'package:flutter/material.dart';
import 'package:recepie_app_demo/model/recepie_model.dart';

class RecepieDetail extends StatefulWidget {
  const RecepieDetail({super.key, required this.recepie});
  final RecepieModel recepie;

  @override
  State<RecepieDetail> createState() => _RecepieDetailState();
}

class _RecepieDetailState extends State<RecepieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recepie.name,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        elevation: 2,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.network(widget.recepie.image, height: 300)],
          ),

          SizedBox(height: 8),
          Column(
            children: [
              Text(
                '📍${widget.recepie.cuisine}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('➤ ${widget.recepie.difficulty}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),)],
            ),
          ),
          Row(
            children: [Text('Ingrident: ${widget.recepie.ingredients.length}')],
          )
        ],
      ),
    );
  }
}
