import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/bloc/weather_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Widget getWeatherIcon(int code){
  switch(code ){
    case >=200 && <300:
      return Image.asset('assets/1.png');
    case >=300 && <=400:
      return Image.asset('assets/2.png');
    case >=500 && <=600:
      return Image.asset('assets/3.png');
    case >=600 && <=700:
      return Image.asset('assets/4.png');
    case >=700 && <=800:
      return Image.asset('assets/5.png');
    case ==800:
      return Image.asset('assets/6.png');
    case >800 && <=804:
      return Image.asset('assets/7.png');  
    default:
      return Image.asset('assets/7.png');
  }
}

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.black,
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
      ),
    ),
    body: Padding(padding:const EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
    child: SizedBox(
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(3, -0.3),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple
              ),
            ),

          ),
          Align(
            alignment: AlignmentDirectional(-3, -0.3),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle
              ),
            ),
          ),
          Align(alignment: AlignmentDirectional(0, -1.2),
          child: Container(
            width: 600,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.yellow
            ),
          ),),
          BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 100.0,
            sigmaY: 100.0,
            
          ),child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
          ),),
          BlocBuilder<WeatherBloc,WeatherState>(

            builder: (context,state){
              if(state is WeatherSuccess){
                return SizedBox(
                width: width,
                height: height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('* ${state.weather.areaName}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),),
                      const SizedBox(height: 8,),
                      Text('Good Morning',style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),),
                      getWeatherIcon(state.weather.weatherConditionCode!),
                       Center(
                        child: Text('${state.weather.temperature!.celsius!.round()}°C',style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w600
                        ),),
                
                      ),
                       Center(
                        child: Text(state.weather.weatherMain!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      SizedBox(height: 8,),
                       Center(
                        child: Text(
                          DateFormat('EEEE dd .').add_jm().format(state.weather.date!),
                          //'Saturday 11 . 12.50pm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        ),),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/11.png',scale: 8,),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Sunrise',style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: 3,),
                                  Text(DateFormat().add_jm().format(state.weather.sunrise!),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),)
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/12.png',scale: 8,),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Sunset',style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: 3,),
                                  Text(DateFormat().add_jm().format(state.weather.sunset!),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(
                        color:Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/13.png',scale: 8,),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Temp max',style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: 3,),
                                  Text(state.weather.tempMax.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),)
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('assets/14.png',scale: 8,),
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Temp Min',style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w300
                                  ),),
                                  SizedBox(height: 3,),
                                  Text(state.weather.tempMin.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ));
              }else{
                return Container();
              }
            },
            
          )
        ],
      ),
    ),
     ),
    );
  }
}