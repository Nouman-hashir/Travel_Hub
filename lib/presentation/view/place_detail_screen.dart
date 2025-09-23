import 'package:flutter/material.dart';
import 'package:travel_hub/presentation/widgets/bottom_section.dart';
import 'package:travel_hub/presentation/widgets/description_section.dart';
import 'package:travel_hub/presentation/widgets/facilities_section.dart';
import 'package:travel_hub/presentation/widgets/header_section.dart';
import 'package:travel_hub/presentation/widgets/tite_section.dart';


class PlaceDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final double rating;

  const PlaceDetailScreen({
    super.key,
    required this.imageUrl,
    required this.placeName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white, // blue background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              HeaderSection(
                imageUrl: imageUrl,
              ),
              TitleSection(
                title: placeName,
                rating: rating,
                reviews: 355,
              ),
              DescriptionSection(
                description:
                    "Aspen is as close as one can get to a storybook alpine town in America. "
                    "The choose-your-own-adventure possibilities—skiing, hiking, dining shopping and ....",
              ),
              FacilitiesSection(),
              BottomSection(price: 199),
            ],
          ),
        ),
      ),
    );
  }
}
