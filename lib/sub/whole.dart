import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Whole extends StatefulWidget {
  const Whole({super.key});

  @override
  State<Whole> createState() => _WholeState();
}

class _WholeState extends State<Whole> {
  PageController controller = PageController(
    initialPage: 1,
    viewportFraction: 0.6,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('handong global university')
            .orderBy('datetime', descending: true)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (!streamSnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (streamSnapshot.hasData) {
            return PageView.builder(
              controller: controller,
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                //var PressList = new List<bool>.filled()
                print(streamSnapshot.data!.docs.length);
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                //Timestamp timestamp = documentSnapshot['datetime'] as Timestamp;
                //DateTime date = timestamp.toDate();
                return Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.lightGreenAccent, Colors.white])),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        /*SizedBox(
                          child: Text(documentSnapshot['writer'], style: TextStyle(fontSize: 50),),
                        ),*/
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          child: Text(documentSnapshot['contents'], style: TextStyle(fontSize: 35),),
                        ),
                      ],
                    ),
                  ),
                );

                /*return Card(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 8, bottom: 8),
                  child: ListTile(
                    //leading: Icon(Icons.person_2_rounded),
                    //style: Padding(),
                    title: Text(
                      documentSnapshot['name'],
                      style: TextStyle(color: Colors.lightGreen),
                    ),
                    subtitle: Text(
                      documentSnapshot['writer'],
                      style: TextStyle(color: Colors.green),
                    ),
                    trailing: SizedBox(
                      width: 150,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              _RaiseCount(documentSnapshot);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.lightGreen,
                            ),
                          ),
                          Text(
                            documentSnapshot['like'].toString(),
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              _update(documentSnapshot);
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    //isThreeLine: true,
                  ),
                  color: Colors.white,
                );*/
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
