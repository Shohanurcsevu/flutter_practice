import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:jsonlist/models/post.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  List<Post> _post=[];

   Future<List<Post>>getPost()async
   {
      String url='https://jsonplaceholder.typicode.com/posts';

      var respose=await http.get(url);

      var resposeBody=jsonDecode(respose.body);
     
      
       print(resposeBody);

       for ( var i in resposeBody)
       {
         Post data =new Post(i['userId'],i['id'],i['title'],i['body']);
         _post.add(data);
       }


       return _post;

   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPost();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("List Tutorial"),
      ),
      body: Container(

        child: new FutureBuilder(

          future: getPost(),
          builder:(BuildContext c, AsyncSnapshot snap) {
            if (snap.data == null) {
              return Center(
               child: SpinKitWave(
                  color: Colors.green,
                  size: 30.0,
                ),
              );
            } else {
              return ListView.builder(
                
                    padding: EdgeInsets.all(10),
                  
                  itemCount: _post.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Card(

                        
                      ),
                    );
                  });
            }
          } ,




        )

        


      ),
      
    );
  }
}