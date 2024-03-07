
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mygetapi.dart';

class MYhomepage extends StatefulWidget {
  @override
  State<MYhomepage> createState() => _MYhomepageState();
}
class _MYhomepageState extends State<MYhomepage> {

  @override

  var myid1='student';
  var mypassword1='student123';
  Color mycolor = Colors.red;
  var name =TextEditingController();
  var Password =TextEditingController();
  var alert ='';
  var welcome = 'welcome';


  @override


  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('$welcome')),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: TextField(
                    controller:name,
                    decoration: InputDecoration(
                      hintText: 'abcd',
                        border: OutlineInputBorder(),
                        prefixIcon:Icon(Icons.login),
                        label:Text('Enter Id')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // width: 250,
                  child: TextField(
                    controller:Password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '123',
                        prefixIcon:Icon(Icons.password),
                        label:Text('Enter Password')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(width: 250,
              child: ElevatedButton(onPressed: () async {

                var name1 =name.text.toString();
                var Password1=Password.text.toString();
                var myid=myid1.toString();
                var mypassword=mypassword1.toString();
                setState(() {
                });
                if(myid==name1 && mypassword ==Password1 ){
                  showDialog(context: context,
                    builder:(context) {
                      return  AlertDialog(title: Text('welcome back'),
                        actions: [
                          ElevatedButton(onPressed: () {
                            // Navigator.pop(context);
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                              return getapi();
                            }
                              ,));
                          }, child: Text('OK'))
                        ],
                      );
                    },);
                  alert=' ';
                }
                else{
                  showDialog(context: context,
                    builder:(context) {
                      return  AlertDialog(title: Text('invalid Id and Password'),
                        actions: [
                          ElevatedButton(onPressed: () {
                            Navigator.pop(context);

                          }, child: Text('OK'))
                        ],
                      );
                    },);

                  print('object');
                  mycolor=Colors.red;
                  setState(() {
                    alert='invalid Id and Password';
                  });
                }
              }, child: Text('Login')),
            ),
            SizedBox(height: 20,),
            // Text(namevalu1),
            Text(alert,style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color:mycolor),),
          ],
        )
    );
  }

}