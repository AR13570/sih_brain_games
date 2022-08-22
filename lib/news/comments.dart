import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sih_brain_games/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Comment_Section extends StatefulWidget {
  const Comment_Section(this.headline,this.id, {Key? key}) : super(key: key);
  final headline;
  final id;

  @override
  _Comment_SectionState createState() => _Comment_SectionState();
}

class _Comment_SectionState extends State<Comment_Section> {
  ValueNotifier<int> pageNum = ValueNotifier(2);

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future<void> addComment(var comm) {
    var res = generateRandomString(30);
    return FirebaseFirestore.instance
        .collection('comment')
        .doc(res)
        .set({'comment': comm, 'news': widget.id, 'id': res})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Comment"),
            content: TextField(
              controller: myController,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Comment'),
            ),
            actions: [TextButton(onPressed: () {
              addComment(myController.text);
              myController.text = "";
              Navigator.pop(context);
            }, child: Text("SUBMIT"))],
          ));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          widget.headline+"- Comments",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            height: 10000000,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('comment')
                  .where('news', isEqualTo: widget.id)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Somthing when wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                }

                final data = snapshot.requireData;

                print(data.docs.toString());
                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return comments(
                        data.docs[index]['comment'],
                      );
                    });
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
        },
        tooltip: 'Comment',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
class comments extends StatelessWidget {
  const comments(
      this.comment,{
        Key? key,
      }) : super(key: key);
  final comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade800, Colors.grey.shade900]),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: Colors.cyan)),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(5),
          child: ListTile(
              title: Center(
                child: Text(
                  comment,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),),
        ),
      ),
    );
  }
}