import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//文化祭のdetail各ページの詳細

class Bunkagym extends StatefulWidget {

  const Bunkagym({super.key});

  @override
  State<Bunkagym> createState() => _Bunkagym();
}

class _Bunkagym extends State<Bunkagym> {

  List<String> eveat= ["@中棟1階 多目的2教室","102","103","104","105"];
  List<String> time= ["8:00","午前","8:00","8:00","8:00",];
  List<String> eve= ["レジン作り","お気軽TRPG倶楽部","レジンを作ろう!","レジンを作ろう!","レジンを作ろう!",];
  @override
  
   Widget build(BuildContext context) {
    
    return Scaffold(
      body: 
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
           const SizedBox(
          height: 10,
        ),
        const Center(child:
        Text('スケジュール',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),), 
        ),
        const SizedBox(
          height: 10,
        ),
        
        Expanded(child: ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: eve.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              child:
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
                leading: Text(time[index],style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                title: Text(eve[index],style: const TextStyle(fontSize: 20),),
                subtitle: Text(eveat[index]),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                onTap: () {
                  context.push('/$index');
                },//gorouterでのタップ時遷移　仮
                 shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              )
            )
            
        
            );
          }
          
         )
        )
      ]
      
      ),
      
    );
   }
}