
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import '../img/photos.dart';


class img extends StatelessWidget{
  List<Photos> postList = [] ;
  Future<List<Photos>> getPostApi ()async{
    final resposne = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos')) ;
    var data = jsonDecode(resposne.body.toString());
    if(resposne.statusCode == 200){
      postList.clear();
      for(Map i in data){
        postList.add(Photos.fromJson(i));
      }
      return postList ;
    }else {
      return postList ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api photos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }else {
                  return
                    ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(postList[index].id.toString()),
                                  Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                                  Text(postList[index].title.toString()),
                                  SizedBox(height: 3,),
                                  Image(image: NetworkImage(postList[index].url.toString()),),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          );
                        }
                        );

                }
              },
            ),
          )
        ],
      ),
    );
  }
}


