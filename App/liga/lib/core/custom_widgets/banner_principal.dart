import 'package:flutter/material.dart';

class BannerPrincipal extends StatelessWidget {
  const BannerPrincipal({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/FondoInicio.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Colors.black45)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido a la Liga",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black.withAlpha(180),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Forjando campeones, construyendo futuros",
                  style: TextStyle(
                    color: Colors.white.withAlpha(180),
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
