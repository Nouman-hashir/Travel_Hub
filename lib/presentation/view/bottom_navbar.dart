import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hub/core/view_model/bottom_navbar_vm.dart';
import 'package:travel_hub/presentation/view/home_screen.dart';
import 'package:travel_hub/presentation/view/ticket_screen.dart';
import 'package:travel_hub/presentation/view/favorites_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _screens = const [
    HomeScreen(),
    TicketScreen(),
    FavoritesScreen(),
    Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomVm = Provider.of<BottomNavbarVm>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _screens[bottomVm.currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final bool isSelected = bottomVm.currentIndex == index;

            final List<IconData> icons = [
              Icons.home_rounded,
              Icons.confirmation_num_rounded,
              Icons.favorite_rounded,
              Icons.person_rounded,
            ];
            return GestureDetector(
              onTap: () {
                bottomVm.updateIndex(index);
              },
              child: Icon(
                icons[index],
                size: 26,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ),
    );
  }
}
