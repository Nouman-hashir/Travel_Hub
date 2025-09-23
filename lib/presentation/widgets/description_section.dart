import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String description;

  const DescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            description,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {},
            child: const Text("Read more",
                style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
