// @dart=2.9
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http; 
import 'dart:convert';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
     home:MyApp(),
     title: 'Weather App',

  ),
);
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var temp;
  var city;
   var description;
   var currently;
   var humidity;
   var windSpeed;

   Future getWeather()async{
     http.Response response =await http.get("http://api.openweathermap.org/data/2.5/weather?q=abuja&appid=005bf28c23875cd35762d1bd66598f37");
     var results= jsonDecode(response.body);
     setState(() {
       this.city=results['name'];
       this.temp=results["main"]["temp"];
       this.description=results['weather'][0]['description'];
       this.currently=results['weather'][0]['main'];
       this.humidity=results['main']['humidity'];
       this.windSpeed=results['wind']['speed'];
     });
    

    }
    void initState(){
       super.initState();
       this.getWeather();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor:Colors.black87,
      body:Column(
        children: [
          Expanded(
            flex: 4,
            child: Container( 
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                ), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      child: Text(
                       city != null? 'Currently in'+'' + city.toString():'Loading',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400

                        ),
                      ),
                      ),
                      Text(
                 currently != null? currently.toString()+"\u00B0" :"Loading",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight:FontWeight.w600,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    temp != null? temp.toString()+ '\u00B0' : 'Loading',
                    style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ),
                  ],
                ),
                ),

          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: ListView(children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf, color: Colors.white),
                  title: Text(
                    'Temperature',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  trailing: Text(
                    temp != null? temp.toString() + '\u00B0':'Loading',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ), 

                ),
                  ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud, color: Colors.white),
                  title: Text(
                    'Weather',
                     style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                     ),
                    
                    ),
                  trailing: Text(
                    description != null? description.toString() :'Loading',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ), 

                ),
                  ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun, color: Colors.white),
                  title: Text(
                    'Humidity',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  trailing: Text(
                    humidity != null? humidity.toString():'Loading',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ), 

                ),
                  ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind, color: Colors.white),
                  title: Text(
                    'Wind Speed',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  trailing: Text(
                    windSpeed != null? windSpeed.toString() :'Loading',
                      style:TextStyle(
                      color:Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    ), 

                ),
              ],
              ),
              ),
              ),
        ],
      ),
    );

  }
}