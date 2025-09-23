import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_hub/core/view_model/bottom_navbar_vm.dart';
import 'package:travel_hub/presentation/view/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavbarVm()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel App',
        home: OnboardingScreen(),
      ),
    );
  }
}

