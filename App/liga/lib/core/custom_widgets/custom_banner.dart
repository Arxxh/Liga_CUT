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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(banner["image"]!, fit: BoxFit.cover),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(12),
                  color: Colors.black45,
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
