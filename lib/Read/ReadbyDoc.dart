import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ReadByDoc extends StatefulWidget {
  const ReadByDoc({super.key});

  @override
  State<ReadByDoc> createState() => _ReadByDocState();
}

class _ReadByDocState extends State<ReadByDoc> {

  Map<String,dynamic>? userData;

  Future<void> fetchUserData() async{
    try{
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc('Epch6l7rAUWz6MSTqWnC')
          .get();
    
      setState(() {
        userData = doc.data() as Map<String, dynamic>?;
      });
  
    }catch(e){
      print("Error Fetch data: $e");
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }


  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
          if(userData != null)
            Text('Name: ${userData!['name']}', style: TextStyle(
              fontSize: 20
            ),)

           else
            CircularProgressIndicator()

            ],
          ),
          
        ),
      ),
    );
  }
}
