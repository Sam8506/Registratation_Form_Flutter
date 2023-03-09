import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mainForm extends StatefulWidget {
  const mainForm({ Key? key }) : super(key: key);

  @override
  State<mainForm> createState() => _mainFormState();
}

class _mainFormState extends State<mainForm> {
  final _formKey = GlobalKey<FormState>();
  String mStatus = 'Male';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key:  _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
           
            children: [
              Container(
                height: 35.0,
                
                decoration: BoxDecoration(
                  
                 ),
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Center(
                  child: Text(
                    'Registration Form',
                  style: TextStyle(
                    fontFamily: GoogleFonts.lato().fontFamily,
                    color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                  )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            
             CircleAvatar(
               backgroundImage:NetworkImage('https://www.clipartmax.com/png/small/277-2772149_manager-icon-female-user-png.png',    ),
              radius: 78,
             ),
              SizedBox(
                height: 10,
              ),
                
             TextFormField(
              
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please Enter Your Name';
                }
                return null;
              },
              decoration: InputDecoration(
    
                prefixIcon: Icon(Icons.person_outlined),
                 border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                    ),
                labelText: 'Enter Name',
                hintText: 'Name',
              ),
           ),
           SizedBox(
             height: 20.0,
           ),
           TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please Enter Email';
                }
                return null;
              },
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.email_outlined),
                border:  OutlineInputBorder(
                      borderRadius:  BorderRadius.circular(25.0),
                    ),
               labelText: 'Enter Email Address',
               hintText: 'Email',
             ),
        
           ),
            SizedBox(
             height: 20.0,
           ),
           TextFormField(
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please Enter Password';
                }
                return null;
              },
        obscureText: true,
             decoration: InputDecoration(
               prefixIcon: Icon(Icons.password_rounded),
                border:  OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(25.0),
                    ),
               labelText: 'Enter Password',
               hintText: 'Password',
             ),
            // keyboardType: TextInputType.visiblePassword,
           ),
           Row(
             children: [
               Expanded(
                 child: RadioListTile<String>(
                   title: Text('Male',
                   style: TextStyle(
                     
                   ),),
                   value: 'Male', 
                   groupValue: mStatus,
                   onChanged: (String? value){
                     setState(() {
                       mStatus = value!;
                     });
                   }
                   ),
               ),
                Expanded(
                 child: RadioListTile<String>(
                   title: Text('Female'),
                   value: 'feMale', 
                   groupValue: mStatus,
                   onChanged: (String? value){
                     setState(() {
                       mStatus = value!;
                     });
                   }
                   ),
               )
             ],
           ),
           
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed: () {
              if(_formKey.currentState !.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Done')),
                );
                Navigator.pushNamed(context, 'dataApi');
              }
            }, 
            child: Text('SUBMIT'),
            ),
           
            ],
          ),
        ),
      ),
    );
  }
}