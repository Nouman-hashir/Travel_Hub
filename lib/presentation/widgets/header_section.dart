import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const HeaderSection({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // add padding around image
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Hero(
              tag: heroTag,
              child: Image.asset(
                imageUrl,
                height: 390,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Back button (top-left)
          Positioned(
            top: 16,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black38,
                    size: 18,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Positioned(
            bottom: -25,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
