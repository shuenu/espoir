import 'package:flutter/material.dart';
import 'package:koyo/widget/widget.dart';

class Bunkoushowde extends StatelessWidget {
  final String title;
  final String place;
  final String detail;
  final String number;

  const Bunkoushowde({
    super.key,
    required this.title,
    required this.place,
    required this.detail,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(title: '発表詳細'),
      body: Padding(
           padding: const EdgeInsets.only(left:20,top:15),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(alignment: Alignment.centerLeft,
            child: Text('$number  $title',style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 30),),),
            const SizedBox(height: 20),
            Text(detail, style: const TextStyle(fontSize: 18)),            
          ]
        ),
      )
    );
  }
}