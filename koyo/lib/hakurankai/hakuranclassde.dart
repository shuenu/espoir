import 'package:flutter/material.dart';
import 'package:koyo/widget/widget.dart';

class KyoDe extends StatelessWidget {
  final String title;
  final String place;
  final String detail;
  final String classname;

  const KyoDe({
    super.key,
    required this.title,
    required this.place,
    required this.detail,
    required this.classname
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(title: 'クラス詳細'),
      body: Padding(
           padding: const EdgeInsets.only(left:20,top:15),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Align(alignment: Alignment.centerLeft,
            child: Text('$classname  $title',style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 30),),),
            Align(alignment: Alignment.centerLeft,
            child: Text('@$place', style: const TextStyle(fontSize: 18)),),
            const SizedBox(height: 20),
            Text(detail, style: const TextStyle(fontSize: 18)),            
          ]
        ),
      )
    );
  }
}