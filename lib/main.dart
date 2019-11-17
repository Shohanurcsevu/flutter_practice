import 'package:flutter/material.dart';

import 'pages/post_page.dart';
void main()=>runApp(Jlist());

class Jlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.purple,


      ),

      home: PostPage(),
      
    );
  }
}