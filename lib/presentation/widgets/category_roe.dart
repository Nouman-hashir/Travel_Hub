import 'package:flutter/material.dart';

class CategoryDemo extends StatefulWidget {
  const CategoryDemo({super.key});

  @override
  State<CategoryDemo> createState() => _CategoryDemoState();
}

class _CategoryDemoState extends State<CategoryDemo> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Location",
    "Hotels",
    "Food",
    "Adventure",
    "Activities",
    "Shopping",
    "Flights",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40, 
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
              
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xff196EEE).withAlpha(20) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Color(0xff196EEE) : Colors.black45,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
