import 'package:flutter/material.dart';

class FacilitiesSection extends StatelessWidget {
  const FacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final facilities = [
      {"icon": Icons.wifi, "label": "Heater"},
      {"icon": Icons.restaurant, "label": "Dinner"},
      {"icon": Icons.bathtub, "label": "Tub"},
      {"icon": Icons.pool, "label": "Pool"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Facilities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: facilities
                .map((f) => Container(
                      width: 75,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 2),
                      decoration: BoxDecoration(
                        color: Color(0xffA8CCF0).withAlpha(50),
                        borderRadius: BorderRadius.circular(12),
                      ),
                  child: Column(
                        children: [
                          Icon(f["icon"] as IconData,
                              color: Colors.black38),
                          const SizedBox(height: 6),
                          Text(f["label"] as String,
                              style: const TextStyle(fontSize: 12, color: Colors.black38)),
                        ],
                      ),
                ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
