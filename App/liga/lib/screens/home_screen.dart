import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liga/core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(15),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: AppColors.appbarPrimary.withOpacity(0.1),
              elevation: 0,
              title: const Text(
                "Inicio",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.8,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "App de la liga de CUT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: screenHeigth * 0.05),
              SizedBox(
                width: screenWidth * 0.6,
                height: screenHeigth * 0.08,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Botón"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
