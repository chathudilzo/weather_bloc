import 'package:weather/weather.dart';

abstract class WeatherState {
  const WeatherState();

  @override
  List<Object> get props=>[];

}


final class WeatherInitialState extends WeatherState{

}


final class WeatherLoading extends WeatherState{

}

final class WeatherFailure extends WeatherState{

}

final class WeatherSuccess extends WeatherState{
  final Weather weather;

  const WeatherSuccess(this.weather);

  List<Object> get props=>[weather];
}