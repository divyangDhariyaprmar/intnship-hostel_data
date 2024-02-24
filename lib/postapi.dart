import 'dart:convert';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Models/api.dart';


class postdata extends StatefulWidget {

  @override
  State<postdata> createState() => _abcdState();
}
class _abcdState extends State<postdata> {
  String countryCode = '91' ;
  TextEditingController user_code = TextEditingController();
  TextEditingController first_name = TextEditingController();
  TextEditingController middle_name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  // TextEditingController phone_country_code =TextEditingController();
  TextEditingController phone_numbe = TextEditingController();
  TextEditingController email = TextEditingController();
  Future<void> postdata()async{
    final reponse =await http.post(Uri.parse("https://glexas.com/hostel_data/API/raj/new_admission_insert.php")
        ,body:{"user_code":user_code.text.toString(),
          'first_name':first_name.text.toString(),
          'middle_name':middle_name.text.toString(),
          'last_name':lastname.text.toString(),
          'phone_number':phone_numbe.text.toString(),
          'phone_country_code':countryCode.toString(),
          'email':email.text.toString(),
        });
    if (reponse.statusCode==200){
      print(reponse.body);
    }
  }
  Future<Api> getdata() async {
    final res = await http.get(
        Uri.parse('https://glexas.com/hostel_data/API/raj/new_admission_insert.php'));
    if(res.statusCode==200){
      return Api.fromJson(jsonDecode(res.body));
    }
    else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('post data in api')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller: user_code,
                decoration: InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  // label:Text('name'),
                  hintText: "Insert your userCode",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller:first_name,
                decoration: InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  // label:Text('name'),
                  hintText: "Insert your firstName",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller: middle_name,
                decoration: InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  // label:Text('name'),
                  hintText: "Insert your middle_name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller: lastname,
                decoration: InputDecoration(
                  focusedBorder:
                  OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Insert your last_name",
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(13.0),
            //   child: TextField(
            //     controller:phone_numbe,
            //     decoration: InputDecoration(
            //       focusedBorder:
            //           OutlineInputBorder(borderSide: BorderSide(width: 3)),
            //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            //       // label:Text('name'),
            //       hintText: "Insert your phone_number",
            //     ),
            //   ),
            // ),


            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:phone_numbe,
                decoration: InputDecoration(
                  prefixIcon: TextButton(
                    style:ElevatedButton.styleFrom(textStyle:TextStyle( fontSize:15)),
                    onPressed: (){
                      showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          countryListTheme: CountryListThemeData(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10)
                              ),
                              inputDecoration: InputDecoration(
                                hintText: 'Start typing to sear' ,
                                labelText: 'Search ' ,
                              )
                          ),
                          favorite: ['In'],
                          onSelect: (Country value){
                            print(value.countryCode.toString());
                            print(value.phoneCode.toString());
                            countryCode = value.phoneCode.toString();
                            setState(() {
                            });
                          }
                      );
                    }, child: Text('$countryCode',style: TextStyle(color: Colors.blue,fontSize:20,fontWeight: FontWeight.bold)),),
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  label:Text('phone_numbe',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Insert your email",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  postdata();
                  print('prese elevateedbutton');
                },
                child: Icon(Icons.add)),
            SizedBox(
              height: 20,
            ),



          ],
        ),
      ),
    );
  }
  // FutureBuilder<Api> mydat() {
  //   return FutureBuilder<Api>(
  //     future: getdata(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Column(
  //           children: [
  //             Text(
  //                 "${snapshot.data!.message.toString()} input valu is ${first_name.text}"),
  //             Text(first_name.text)
  //           ],
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text('${snapshot.error}');
  //       }
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }
}
