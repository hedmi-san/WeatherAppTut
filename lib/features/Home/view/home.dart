import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapptut/constants/const.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherFactory _wf = WeatherFactory(OPEN_WEATHER_API_KEY);
  Weather? _weather;
  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName('El Eulma').then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _weather?.areaName ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          _dateTimeInfo(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          _weatherIcon(),
        ],
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '  ${DateFormat("d.m.y").format(now)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                _weather!.weatherIcon!,
              ),
            ),
          ),
        )
      ],
    );
  }
}
