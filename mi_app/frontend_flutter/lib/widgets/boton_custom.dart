import 'package:flutter/material.dart';

class BotonPersonalizado extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color color;
  final double ancho;
  final double alto;

  const BotonPersonalizado({
    super.key,
    required this.texto,
    required this.onPressed,
    this.color = Colors.blue,
    this.ancho = double.infinity,
    this.alto = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho,
      height: alto,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
