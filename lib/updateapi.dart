


import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'mygetapi.dart';
class update extends StatefulWidget{
  final registration_main_id;
  final usercode;
  final first_name;
  final middle_name;
  final last_name;
  final phone_numbe;
  final email;
  update(this.registration_main_id, this.usercode, this.first_name, this.middle_name, this.last_name, this.phone_numbe, this.email);

  @override
  State<update> createState() => _updateState();
}
class _updateState extends State<update> {

  String countryCode = '91' ;
  TextEditingController user_code = TextEditingController();
  TextEditingController first_name= TextEditingController();
  TextEditingController middle_name= TextEditingController();
  TextEditingController last_name= TextEditingController();
  TextEditingController phone_numbe= TextEditingController();
  TextEditingController phone_country_code= TextEditingController();
  TextEditingController email= TextEditingController();

  Future<void> postdata()async{
    final reponse =await http.post(Uri.parse("https://glexas.com/hostel_data/API/raj/new_admission_update.php")
        ,body:{
         "registration_main_id":widget.registration_main_id.toString(),
          'first_name':first_name.text.toString(),
          'user_code':user_code.text.toString(),
          'middle_name':middle_name.text.toString(),
          'last_name':last_name.text.toString(),
          'phone_number':phone_numbe.text.toString(),
          'phone_country_code':countryCode.toString(),
          'email':email.text.toString(),
        });
    if (reponse.statusCode==200){
      print(reponse.body);

    }
  }
  @override
  Widget build(BuildContext context) {

    setState(() {
      user_code.text=widget.usercode;
      first_name.text=widget.first_name;
      middle_name.text=widget.middle_name;
      last_name.text=widget.last_name;
      phone_numbe.text=widget.phone_numbe;
      email.text=widget.email;

      print(widget.registration_main_id+widget.first_name+widget.middle_name+widget.last_name+widget.phone_numbe+widget.email);
print(widget.usercode);
      // user_code.text=widget.user_code;
      // first_name.text=widget.first_name;
      // middle_name.text=widget.middle_name;
      // last_name.text=widget.last_name;
      // phone_numbe.text=widget.phone_numbe;
      // // phone_country_code.text=widget.user_code;
      // email.text=widget.email;


    });
    return Scaffold(backgroundColor: Colors.white70,
      appBar:AppBar(title:Text('UPDATE your details')),
      body:SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
              height:20,
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:user_code,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  label:Text('user_code',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:first_name,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  label:Text('first_name',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:middle_name,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  label:Text('middle_name',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:last_name,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  label:Text('last_name',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
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
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                controller:email,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width:3)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                  label:Text('email',style: TextStyle(color: Colors.black,fontSize:20)),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              postdata();
              print('prese elevateedbutton');
              Navigator.push(context,MaterialPageRoute(builder: (context) => getapi(),));
            }, child:Text('update detail')),

          ],
        ),
      ),
    );
  }
}