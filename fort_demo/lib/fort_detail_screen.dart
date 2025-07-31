import 'package:flutter/material.dart';
import 'package:fort_demo/model/fort_model.dart';

class FortDetailScreen extends StatefulWidget {
  const FortDetailScreen({super.key, required this.fort});
  final FortModel fort;

  @override
  State<FortDetailScreen> createState() => _FortDetailScreenState();
}

class _FortDetailScreenState extends State<FortDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.fort.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
    elevation: 2,
    centerTitle: true,
    ),
    body: Column(
      children: [
        SizedBox(height: 16),
       Center(child: Icon(Icons.fort,size: 150,),),
       SizedBox(height: 16),
       Text("📌 ${widget.fort.location}",style: TextStyle(fontSize:24, fontWeight: FontWeight.w500),),
       SizedBox(height: 16),
       Text('🛣️ ${widget.fort.distance} km from Pune',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),)
      ],
    )
    );
  }
}
