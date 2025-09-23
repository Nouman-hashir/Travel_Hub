import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final double rating;
  final int reviews;

  const TitleSection({
    super.key,
    required this.title,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title + Rating
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text("$rating ($reviews Reviews)",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),

          // Show map
          TextButton(
            onPressed: () {},
            child: const Text("Show map",
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
