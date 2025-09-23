import 'package:flutter/material.dart';
import 'package:travel_hub/presentation/view/place_detail_screen.dart';
import 'package:travel_hub/presentation/widgets/category_roe.dart';
import 'package:travel_hub/presentation/widgets/place_card.dart';
import 'package:travel_hub/presentation/widgets/recommended_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> places = [
      {
        "imageUrl": "assets/images/image1.png",
        "placeName": "Alley Palace",
        "rating": 4.5,
      },
      {
        "imageUrl": "assets/images/image2.png",
        "placeName": "Aspen Hotel",
        "rating": 4.7,
        'height': 330,
      },
      {
        "imageUrl": "assets/images/image3.png",
        "placeName": "Mountain View",
        "rating": 4.8,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Color(0xFF196EEE), size: 15),
                      SizedBox(width: 5),
                      Text(
                        'Aspen, USA',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_drop_down, color: Color(0xFF196EEE)),
                    ],
                  ),
                ],
              ),
          
              const SizedBox(height: 10),
              const Text(
                'Aspen',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  fontFamily: 'Serif',
                ),
              ),
          
              const SizedBox(height: 16),
          
              // 🔹 Search Bar
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xffA8CCF0).withAlpha(50),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black38),
                    hintText: 'Search Destination',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 30),
          
              // 🔹 Category Row
              const CategoryDemo(),
          
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Popular",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff196EEE),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: places.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 15),
                        itemBuilder: (context, index) {
                          final place = places[index];
                          final height = place.containsKey('height') ? place['height'] : 280;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlaceDetailScreen(
                                    imageUrl: place["imageUrl"],
                                    placeName: place["placeName"],
                                    rating: place["rating"],
                                  ),
                                ),
                              );
                            },
                            child: PlaceCard(
                              imageUrl: place["imageUrl"],
                              placeName: place["placeName"],
                              rating: place["rating"],
                              height: height,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Recommended",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
          
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                        children: const [
                          TravelCard(
                            imageUrl:
                                "assets/images/recommended1.png",
                            title: "Explore Aspen",
                            duration: "4N/5D",
                            isHotDeal: true,
                          ),
                          TravelCard(
                            imageUrl:
                                "assets/images/recommende2.png",
                            title: "Luxurious Aspen",
                            duration: "2N/3D",
                            isHotDeal: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
