import 'package:flutter/material.dart';

class ForecastItemCard extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;
  const ForecastItemCard(
      {super.key,
      required this.time,
      required this.icon,
      required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                'https://openweathermap.org/img/w/$icon.png',
                width: 50,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.signal_wifi_connected_no_internet_4);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(temperature),
          ],
        ),
      ),
    );
  }
}
