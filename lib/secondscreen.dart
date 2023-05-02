import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  List<TextEditingController> words=[];
  //final String e;

  SecondScreen(this.words);

  //SecondScreen(@required this.word1,@required this.word2,@required this.word3,@required this.word4,@required this.word5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Welcome on my page'),
        ),
        backgroundColor: Colors.white70,
        body: Container(
          child: Center(
            child: ListView.builder(
    shrinkWrap: true,
              itemCount: words.length,
                itemBuilder: (BuildContext context,int index){
                return Text(words[index].text);

    }


            ),
          ),
        )


    );}

}