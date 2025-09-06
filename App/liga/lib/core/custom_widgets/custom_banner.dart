import 'package:flutter/material.dart';

// La verdad este banner si me dio la idea ChatGipiti pero no le digan a nadie (>'-'<) //

class CustomBanner extends StatelessWidget {
  CustomBanner({super.key});

  final List<Map<String, String>> banners = [
    {
      "title": "Partido del fin de semana",
      "image": "assets/images/Partido.jpeg",
    },
    {"title": "Tabla de posiciones", "image": "assets/images/Tabla.jpg"},
    {"title": "Jugador destacado del mes", "image": "assets/images/Isaac.jpeg"},
    {"title": "Noticias de la liga", "image": "assets/images/Noticias.jpg"},
  ];

  final PageController _pageController = PageController(viewportFraction: 0.90);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          EdgeInsets margin;
          if (index == 0) {
            margin = const EdgeInsets.only(left: 0, right: 6);
          } else if (index == banners.length - 1) {
            margin = const EdgeInsets.only(left: 6, right: 0);
          } else {
            margin = const EdgeInsets.symmetric(horizontal: 6);
          }
          return Card(
            margin: margin,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(banner["image"]!, fit: BoxFit.cover),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(12),
                  color: Colors.black38,
                  child: Text(
                    banner["title"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
