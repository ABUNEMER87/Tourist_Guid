import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

  const TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    super.key,
    required void Function(String tripId) removeItem,
  });

  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed(
      // Assuming you have a trip detail screen route
      '/trip-detail',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text('$duration days'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(tripTypeText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.sunny),
                      const SizedBox(width: 6),
                      Text(seasonText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.Exploration:
        return 'Exploration';
      case TripType.Relaxation:
        return 'Relaxation';
      case TripType.Adventure:
        return 'Adventure';
      case TripType.Culture:
        return 'Culture';
      default:
        return 'Unknown';
    }
  }

  String get seasonText {
    switch (season) {
      case Season.Summer:
        return 'Summer';
      case Season.Winter:
        return 'Winter';
      case Season.Spring:
        return 'Spring';
      case Season.Autumn:
        return 'Autumn';
      default:
        return 'Unknown';
    }
  }
}
