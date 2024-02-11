import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:weather_bloc/bloc/weather_event.dart';
import 'package:weather_bloc/bloc/weather_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_bloc/data/my_data.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  WeatherBloc():super(WeatherInitialState()){
    on<FetchWeather>((event,emit)async{
      try{
        WeatherFactory wf=WeatherFactory(API_KEY,language: Language.ENGLISH);
        
 
        
        Weather weather=await wf.currentWeatherByLocation(event.position.latitude,event.position.longitude);

        print(weather);
        
        emit(WeatherSuccess(weather));
      }catch(error){
        emit (WeatherFailure());
      }
    });
  }
}