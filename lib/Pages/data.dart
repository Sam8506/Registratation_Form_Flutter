import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dataApi extends StatefulWidget {
  const dataApi({ Key? key }) : super(key: key);

  @override
  State<dataApi> createState() => _dataApiState();
}

class _dataApiState extends State<dataApi> {

  late String strResponse;
  late Map mapResponse;
  late Map perticularData;
  late Map supportData;
 List? listResponse;

  Future callApi() async{
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response.statusCode == 200){
      setState(() {
        //strResponse = response.body;
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse['data'];
        supportData = mapResponse['support'];
      });
    }
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information'),
        backgroundColor: Colors.deepPurple,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new)
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.next_plan),
              onPressed: (){
                Navigator.pushNamed(context, 'cricket');
              },
              )

            
          ],
      ),

      body:listResponse==null? Center(
        child: CircularProgressIndicator(),
      ):
      
      ListView.builder(

        itemCount: listResponse == null? 0: listResponse!.length,
        itemBuilder: ((context, index){
          return Container(
            color: Colors.deepPurple[100],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                        Container(
                        height: 200,
                        width: 200,
                         child: Image.network(listResponse![index]['avatar'])
                      );
                    },
                    child: Image.network(listResponse![index]['avatar'])),
                  ),
                 SingleChildScrollView(
                   child: Container(
                     height: 120,
                     width: 220,
                     decoration: BoxDecoration(
                       color: Colors.lightBlue[50],
                       borderRadius: BorderRadius.circular(5)
                 
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(padding: EdgeInsets.all(4)),
                          Text('Id:'+listResponse![index]['id'].toString()),
                          Text('\nEmail:-'+listResponse![index]['email'].toString()),
                          Text('\nFirst Name:-'+listResponse![index]['first_name'].toString()),
                          Text('\nLast Name:-'+listResponse![index]['last_name'].toString())
                       ],
                     ),
                   ),
                 )
            
                ],
              ),
            ),
          );
        }
        )
        
        )

      // body: Center(
      //       child: Container(
      //         height: 250,
      //         width: 325,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(30),
      //          color: Colors.lightBlue[100] 

      //         ),
      //         child: Center(
      //           child:
      //         listResponse == null?
      //         Text('Data is Loading') 
      //         : 
      //         Text(listResponse[0]['email'].toString()
      //         )
      //         ),
      //       ),
      //     )
        
    );
  }
}