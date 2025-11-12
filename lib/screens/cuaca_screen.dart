import 'package:flutter/material.dart';

class WeatherData {
  final String city;
  final String country;
  final int temperature;
  final int highTemp;
  final int lowTemp;
  final String condition;
  final String assetImage;

  WeatherData({
    required this.city,
    required this.country,
    required this.temperature,
    required this.highTemp,
    required this.lowTemp,
    required this.condition,
    required this.assetImage,
  });
}

class HourlyForecast {
  final String time;
  final String icon;
  final int temp;
  final int precipitation;

  HourlyForecast({
    required this.time,
    required this.icon,
    required this.temp,
    this.precipitation = 0,
  });
}

class CuacaScreen extends StatefulWidget {
  const CuacaScreen({super.key});

  @override
  State<CuacaScreen> createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  int _currentIndex = 0;

  final List<WeatherData> _weatherData = [
    WeatherData(
      city: 'Montreal',
      country: 'Canada',
      temperature: 19,
      highTemp: 24,
      lowTemp: 18,
      condition: 'Mid Rain',
      assetImage: 'public/cuaca-asset/Sun-cloud-mid-rain.png',
    ),
    WeatherData(
      city: 'Toronto',
      country: 'Canada',
      temperature: 20,
      highTemp: 25,
      lowTemp: 19,
      condition: 'Fast Wind',
      assetImage: 'public/cuaca-asset/Moon-cloud-fast-wind.png',
    ),
    WeatherData(
      city: 'Tokyo',
      country: 'Japan',
      temperature: 13,
      highTemp: 19,
      lowTemp: 9,
      condition: 'Showers',
      assetImage: 'public/cuaca-asset/Sun-cloud-angled-rain.png',
    ),
    WeatherData(
      city: 'Jakarta',
      country: 'Indonesia',
      temperature: 23,
      highTemp: 29,
      lowTemp: 21,
      condition: 'Tornado',
      assetImage: 'public/cuaca-asset/Tornado.png',
    ),
  ];

  final List<HourlyForecast> _hourlyForecasts = [
    HourlyForecast(
      time: '12 AM',
      icon: 'public/cuaca-asset/Moon-cloud-mid-rain.png',
      temp: 19,
      precipitation: 30,
    ),
    HourlyForecast(
      time: 'Now',
      icon: 'public/cuaca-asset/Sun-cloud-mid-rain.png',
      temp: 19,
      precipitation: 0,
    ),
    HourlyForecast(
      time: '2 AM',
      icon: 'public/cuaca-asset/Moon-cloud-fast-wind.png',
      temp: 18,
      precipitation: 0,
    ),
    HourlyForecast(
      time: '3 AM',
      icon: 'public/cuaca-asset/Moon-cloud-mid-rain.png',
      temp: 19,
      precipitation: 0,
    ),
    HourlyForecast(
      time: '4 AM',
      icon: 'public/cuaca-asset/Moon-cloud-mid-rain.png',
      temp: 19,
      precipitation: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9D5FF),
                  border: Border.all(color: const Color(0xFF222222), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF000000),
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Cuaca',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF222222),
                    ),
                  ),
                ),
              ),
            ),

            // Main Weather Display
            Expanded(
              child: PageView.builder(
                itemCount: _weatherData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final weather = _weatherData[index];
                  return _buildMainWeatherCard(weather);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainWeatherCard(WeatherData weather) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Main Weather Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFB3E5FC),
              border: Border.all(color: const Color(0xFF222222), width: 4),
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF000000),
                  offset: Offset(6, 6),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Column(
              children: [
                // City Name
                Text(
                  weather.city,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF222222),
                  ),
                ),
                Text(
                  weather.country,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF666666),
                  ),
                ),
                const SizedBox(height: 30),

                // Weather Icon (larger)
                Center(
                  child: Image.asset(
                    weather.assetImage,
                    width: 220,
                    height: 220,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.wb_cloudy,
                        size: 180,
                        color: Color(0xFF222222),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                // Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.temperature}',
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF222222),
                        height: 1,
                      ),
                    ),
                    const Text(
                      '°C',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Condition
                Text(
                  weather.condition,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF666666),
                  ),
                ),

                const SizedBox(height: 10),

                // High/Low
                Text(
                  'H: ${weather.highTemp}° L: ${weather.lowTemp}°',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF666666),
                  ),
                ),

                const SizedBox(height: 20),

                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _weatherData.length,
                    (index) => Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? const Color(0xFF222222)
                            : Colors.white,
                        border: Border.all(
                          color: const Color(0xFF222222),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: _currentIndex == index
                            ? const [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  offset: Offset(2, 2),
                                  blurRadius: 0,
                                ),
                              ]
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Hourly Forecast Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF222222), width: 4),
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF000000),
                  offset: Offset(4, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HOURLY FORECAST',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF222222),
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      return _buildHourlyForecastItem(_hourlyForecasts[index]);
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Air Quality (Full width)
          _buildAirQualityCard(),

          const SizedBox(height: 16),

          // UV Index and Sunrise (Row)
          Row(
            children: [
              Expanded(child: _buildUVIndexCard()),
              const SizedBox(width: 16),
              Expanded(child: _buildSunriseCard()),
            ],
          ),

          const SizedBox(height: 16),

          // Wind and Rainfall (Row)
          Row(
            children: [
              Expanded(child: _buildWindCard()),
              const SizedBox(width: 16),
              Expanded(child: _buildRainfallCard()),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAirQualityCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5936B4),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.air, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Text(
                'AIR QUALITY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '3-Low Health Risk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Gradient bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4FC3F7),
                  Color(0xFF9C27B0),
                  Color(0xFFE91E63),
                ],
              ),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFF222222), width: 1),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'See more',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_right,
                color: Colors.white.withOpacity(0.7),
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUVIndexCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5936B4),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Text(
                'INDEKS UV',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '4',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Sedang',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // UV gradient bar
          Container(
            height: 6,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF4FC3F7),
                  Color(0xFF9C27B0),
                  Color(0xFFE91E63),
                ],
              ),
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: const Color(0xFF222222), width: 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSunriseCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5936B4),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.wb_twilight, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Text(
                'SUNRISE',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '5:28 AM',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
            ),
          ),
          const SizedBox(height: 12),
          // Sunrise arc
          CustomPaint(
            size: const Size(double.infinity, 40),
            painter: SunriseArcPainter(),
          ),
          const SizedBox(height: 8),
          Text(
            'Sunset: 7:25PM',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWindCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5936B4),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.air, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Text(
                'WIND',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Wind compass
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Compass circle
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54, width: 2),
                    ),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'N',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'S',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              'W',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: Text(
                              'E',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Wind direction arrow
                  const Icon(Icons.navigation, color: Colors.white, size: 30),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              '9.7',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1,
              ),
            ),
          ),
          const Center(
            child: Text(
              'km/h',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRainfallCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF5936B4),
        border: Border.all(color: const Color(0xFF222222), width: 4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(6, 6),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.water_drop, color: Colors.white70, size: 18),
              const SizedBox(width: 8),
              Text(
                'RAINFALL',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white.withOpacity(0.7),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Center(
            child: Text(
              '1.8 mm',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'in last hour',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHourlyForecastItem(HourlyForecast forecast) {
    final isNow = forecast.time == 'Now';
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isNow ? const Color(0xFFFFF59D) : const Color(0xFFF5F5F5),
        border: Border.all(color: const Color(0xFF222222), width: 2),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(3, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            forecast.time,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Color(0xFF222222),
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            forecast.icon,
            width: 40,
            height: 40,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.wb_cloudy,
                size: 35,
                color: Color(0xFF222222),
              );
            },
          ),
          const SizedBox(height: 8),
          if (forecast.precipitation > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.water_drop,
                  size: 12,
                  color: Color(0xFF2196F3),
                ),
                const SizedBox(width: 2),
                Text(
                  '${forecast.precipitation}%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ],
            )
          else
            const SizedBox(height: 16),
          const SizedBox(height: 4),
          Text(
            '${forecast.temp}°',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: Color(0xFF222222),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Sunrise Arc
class SunriseArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    final rect = Rect.fromLTWH(0, 10, size.width, size.height);

    // Draw arc from left to right (sunrise arc)
    path.addArc(rect, 3.14, 3.14); // π to 2π (bottom half circle)

    canvas.drawPath(path, paint);

    // Draw sun indicator dot
    final sunPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Position sun at middle-right of arc (around 5:28 AM position)
    canvas.drawCircle(Offset(size.width * 0.7, 15), 5, sunPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
