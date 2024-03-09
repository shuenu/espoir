import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//博覧のdetailそれぞれのページの内容記載

class Kyo extends StatefulWidget {
   const Kyo({super.key});

   @override
   State<Kyo> createState() => _Kyo();
}

class _Kyo extends State<Kyo> {

List<String> kyo= ["101","102","103","104","105","106","107","108","109"];
List<String> title= ["格付けチェック","104格付けチェック","104格付けチェック","104格付けチェック",
"104格付けチェック","104格付けチェック","104格付けチェック","104格付けチェック","104格付けチェック",];
List<String> kyoat= ["@中棟3階 104教室","@中棟3階","@中棟3階","@中棟3階","@中棟3階","@中棟3階","@中棟3階","@中棟3階","@中棟3階",];
List<dynamic> post=[
  Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),
  Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),
  Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),Image.asset('images/postest.jpg'),
];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(//スクロール可能
        child: Padding(//余白設定
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Padding(
           padding: EdgeInsets.only(left:20,top:15),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                    Text('博覧会',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
                    SizedBox(
                      height: 5,
                    ),
                Text('6月19日（月）9:00~15:00\n6月19日（月）9:30~15:30',style: TextStyle(fontSize: 18),),
                  ]
            )
                  ),
        const SizedBox(//間設定
          height: 15,
        ),
        const Center(child:
        Text('スケジュール',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),), 
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('classes')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('エラー');
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    final docs = snapshot.data!.docs;
           return ListView.builder(//体育祭の各種目を一覧表示
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:9,
          itemBuilder: (BuildContext context, int index) {
                    final doc = docs[index];
                    final data = doc.data()! as Map<String,dynamic>;
                    final List<Widget> crowdimg = <Widget>[
                     Image.asset('images/crowdone.jpg'),
                     Image.asset('images/crowdtwo.jpg'),
                     Image.asset('images/crowdthree.jpg'),
                    ];
            return Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
              child:
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
            //side: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
          ),
              child: ListTile(
               leading: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: post.elementAt(index)
                  ),
                title: Text(title[index],style: const TextStyle(fontSize: 17),),
                subtitle: Text(kyoat[index]),
                tileColor: const Color.fromARGB(255, 241, 249, 255),
                trailing: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: crowdimg.elementAt(data['crowd'])
                ),
                
                  /*DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('1'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('2'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('3'),
                ),
              ],
              onChanged: (value) {
               FirebaseFirestore.instance
                        .collection('classes')
                        .doc(doc.id)
                        .update({'crowd' : value});
              },
              value: data['crowd'],
            ),]
            ),*/
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
             
        );
          }
        )
        ]
          )
        )
      )
         );
                  }
                  }


class Butai extends StatefulWidget {
   const Butai({super.key});

   @override
   State<Butai> createState() => _Butai();
}

class _Butai extends State<Butai> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
         Expanded(
          child:ListView.builder(
            itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: ()  {
                context.push('/$index');
                  }, 
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),

                   )
                ]
                ),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
              child: Column(
                children: [
                  Text(sp[index],style: const TextStyle(fontSize: 20),),
                  const Text("Title",style: TextStyle(fontSize: 15),)
              ],
            )
            )
            )
            );
          }
          )
         )
      ]
      )
      
        );
}
}

class Club extends StatefulWidget {
   const Club({super.key});

   @override
   State<Club> createState() => _Club();
}

class _Club extends State<Club> {

List<String> sp= ["101","102","103","104","105","106","107","108","109"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
         Expanded(
          child:ListView.builder(
            itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: ()  {
                context.push('/$index');
                  }, 
             child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueGrey[50],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),

                   )
                ]
                ),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
              child: Column(
                children: [
                  Text(sp[index],style: const TextStyle(fontSize: 20),),
                  const Text("Title",style: TextStyle(fontSize: 15),)
              ],
            )
            )
            )
            );
          }
          )
         )
      ]
      )
      
        );
}
}