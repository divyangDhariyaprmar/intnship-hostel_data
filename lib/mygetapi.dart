

import 'dart:convert';
import 'package:api/Models/getmodal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
// import '../Models/getmodal.dart';
import 'postapi.dart';
import 'updateapi.dart';

class getapi extends StatefulWidget{
  @override

  State<getapi> createState() => _getapiState();
}
class _getapiState extends State<getapi> {

  late Future<Getmodal> _futureData;
  late List _dataList = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _futureData = getdata();
    _searchController = TextEditingController();
  }

 var year ="2024";
 var abc;
 var find;
 bool searchshow=true;
  bool sort =true;
  bool more=true;
  DateTime date=DateTime.now().toLocal();

  ScrollController scrollController = ScrollController();
  Future<Getmodal> getdata() async {
    final res = await http.get(
        Uri.parse('https://glexas.com/hostel_data/API/raj/new_admission_list.php'));
    if(res.statusCode==200){
      // print(res.body);

      return Getmodal.fromJson(jsonDecode(res.body));
    }
    else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(()  {
    });
    // TODO: implement build
   return Scaffold(
     appBar:AppBar(
       backgroundColor: Colors.orangeAccent.shade200,
       elevation: 10,
       title:Text('hostel admission',style: TextStyle(fontSize:25)),
         actions: [
           TextButton(
             onPressed: () {
             sort =!sort;
             setState(() {
             });
           }, child:sort?Icon(CupertinoIcons.sort_down,color: Colors.black,):Icon(CupertinoIcons.sort_up,color: Colors.black,),),
           TextButton(
               // style: ElevatedButton.styleFrom(backgroundColor:Colors.black.withAlpha(200)),
               onPressed: () {
             setState(() {
             });
           }, child:Icon(Icons.refresh,color: Colors.black,)),
         ],
     ),

     body:
    Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Visibility(
              visible:searchshow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                    // Trigger rebuild on every change
                  },
                  decoration: InputDecoration(
                    labelText: 'Search by Search by First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            Expanded(
              child:
              FutureBuilder<Getmodal>(
                future: _futureData,

                builder: (context , snapshot){
                  if(snapshot.hasData){
                    _dataList = snapshot.data!.response ?? [];
                    return
                      ListView.builder(
                        controller: scrollController,
                          itemCount: _filteredData.length,
                          itemBuilder: (context, index){
                            //sort data in firstname
                            sort?snapshot.data!.response!.sort((a, b) => b.firstName.toString().compareTo(a.firstName.toString())):
                            snapshot.data!.response!.sort((a, b) => a.firstName.toString().
                            compareTo(b.firstName.toString()));

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: InkWell(
                                onTap: () {
                                  find=index;
                                  print(find);
                                  more=!more;
                                  // print(index);
                                  setState(() {
                                  });
                                },
                                child: Card(
                                  shadowColor: Colors.black,
                                  elevation: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            child: Text(_filteredData[index].registrationMainId.toString(),
                                              style: TextStyle(color: Colors.black)),
                                          backgroundColor: Colors.blue.shade50,
                                          ),


                                        TextButton(onPressed: () {
                                          find=index;
                                          print(find);
                                          more=!more;
                                          // print(index);
                                          setState(() {
                                          });
                                        }, child: Icon(
                                          color:Colors.black.withAlpha(200),
                                          more? CupertinoIcons.eye_slash_fill :CupertinoIcons.eye_solid ,
                                        )
                                        ),
                                      ],
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      ),

                                      index==find?
                                      Visibility(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Align(
                                              child: Padding(
                                                padding:more? EdgeInsets.only(left:10.0):EdgeInsets.only(left:60.0),
                                                child: Column(
                                                  children: [

                                                  Text('FirstName ', style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                  SizedBox(height: 3,),
                                                    _filteredData[index].firstName.toString().isEmpty
                                                        ? Text('Null') :
                            Text(_filteredData[index].firstName.toString(),

                            style: TextStyle(fontSize:17)),
                                                    SizedBox(height: 5,),
                                                    Visibility(
                                                    child: Column(children: [
                                                      Text('Middle Name' ,
                                                        style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 3,),
                                                      _filteredData[index].middleName.toString().isEmpty ? Text('Null'):
                                                      Text(_filteredData[index].middleName.toString(),
                                                          style: TextStyle(fontSize:17)),
                                                      SizedBox(height: 5,),
                                                      Text('Last name' ,
                                                        style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 3,),
                                                      _filteredData[index].lastName.toString().isEmpty ? Text('Null') : Text(snapshot.data!.response![index].lastName.toString(),
                            style: TextStyle(fontSize:17)),
                                                    ],),
                                                    visible:more,
                                                  ),

                                                ],
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,),
                                              ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(right:10),
                                              child:
                                              Column(children: [

                                                Visibility(
                                                  visible :more,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height:10,),
                                                     Text('CountryCode' , style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 3,),
                                                      snapshot.data!.response![index].phoneCountryCode.toString().isEmpty  ?
                                                      Text('Null'):Text(snapshot.data!.response![index].phoneCountryCode.toString(),style: TextStyle(fontSize:17)),
                                                      SizedBox(height: 7,),
                                                      Text(' phone Number' , style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 3,),
                                                      Text(_filteredData[index].phoneNumber.toString(),style: TextStyle(fontSize:17)),

                                                      SizedBox(height: 5),
                                                      snapshot.data!.response![index].phoneCountryCode.toString().isEmpty? Text('Null') :
                                                      Text('Email' , style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 3,),
                                                      Text(_filteredData[index].email.toString(),style: TextStyle(fontSize:17)),


                                                    ],
                                                  ),
                                                ),

                                                SizedBox(height: 25,)

                                              ],),

                                            ),
                                          ],),
                                      ) : Center(child: Column(
                                        children: [
                                          Text("FirstName",style: TextStyle(color:Colors.blue,fontSize: 17 , fontWeight: FontWeight.bold)),
                                          Text(_filteredData[index].firstName.toString()),
                                        ],
                                      )),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          snapshot.data!.response![index].createdTime.toString().substring(0,4)==date.year.toString() &&
                                              int.parse(snapshot.data!.response![index].createdTime.toString().substring(5,7)) ==date.month &&
                                              int.parse(snapshot.data!.response![index].createdTime.toString().substring(8,10)) >= date.day-2
                                    ? Visibility(
                                            child: ElevatedButton(onPressed: () {
                                              print('${snapshot.data!.response![index].createdTime.toString()}');

                                              print(' ${int.parse(snapshot.data!.response![index].createdTime.toString().substring(8,10))}');
                                              var manth=date.year;
                                              print(manth-1.toInt());

                                              if(manth+1.toInt()<int.parse(snapshot.data!.response![index].createdTime.toString().substring(5,7))){
                                                print('is bige of the 0');
                                              }else{
                                                print('object');
                                              }
                                              print('${date.runtimeType}');

                                              var registrationMainId = snapshot.data!.response![index].registrationMainId.toString();
                                              var userCode = snapshot.data!.response![index].userCode.toString();
                                              var firstName = snapshot.data!.response![index].firstName.toString();
                                              var middleName = snapshot.data!.response![index].middleName.toString();
                                              var lastName = snapshot.data!.response![index].lastName.toString();
                                              var phoneNumber = snapshot.data!.response![index].phoneNumber.toString();
                                              var email = snapshot.data!.response![index].email.toString();


                                              Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                              update(registrationMainId,userCode,firstName,middleName,lastName,phoneNumber,email),));
                                            }, child: Text('update')),
                                          ): Text(''),

                                          snapshot.data!.response![index].createdTime.toString().substring(0,4)==date.year.toString() &&
                                              int.parse(snapshot.data!.response![index].createdTime.toString().substring(5,7)) ==date.month &&
                                              int.parse(snapshot.data!.response![index].createdTime.toString().substring(8,10)) >= date.day-2
                                         ? ElevatedButton(onPressed: () {
                                            print(snapshot.data!.response![index].registrationMainId.toString());
                                            String id =snapshot.data!.response![index].registrationMainId.toString();
                                            delete(id);
                                            // Navigator.push(context,MaterialPageRoute(builder: (context) => getapi(),));
                                            setState(() {
                                            });
                                          }, child: Text('delete')):Text(''),
                                        ],
                                      ),




                                    ],

                                  ),

                                ),
                              ),
                            );
                          });
                  }else {
                    return Text('loding.....');
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(onPressed: () {
                //   scrollController.animateTo(scrollController.position.maxScrollExtent, duration:Duration(seconds:5),
                //       curve:Curves.easeIn);
                // }, child:Icon(Icons.vertical_align_bottom_outlined)),

                ElevatedButton(
                  // style: ElevatedButton.styleFrom(backgroundColor:Colors.black.withAlpha(200)),

                onPressed:() {
                 Navigator.push(context,MaterialPageRoute(builder: (context) {
                   return postdata();
                 },));
                },child: Text('Enter to add data',style: TextStyle(fontSize:15)),),
              ],
            ),


          ],
        ),
      ),
   );
  }

  //search in list function
  List get _filteredData {
    final query = _searchController.text.toLowerCase();
    return _dataList.where((data) {
      return data.firstName.toString().toLowerCase().contains(query)||
          data.middleName.toString().toLowerCase().contains(query)||
          data.lastName.toString().toLowerCase().contains(query);
    }).toList();
  }

//delete function
  Future<void>delete(data)async{
    try{
      final reponsep =await http.post(Uri.parse("https://glexas.com/hostel_data/API/raj/new_admission_delete.php")
          ,body:{
            'registration_main_id':data,
          });
      if (reponsep.statusCode==200){
        print(reponsep.body);
      }
    }catch(error){
      print('Error: $error');
    }
  }



}


