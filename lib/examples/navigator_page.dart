
import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator Page")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallePage(nombre: "Jhonny"),
                  ),
                );
              },
              child: Text("Ir a DETALLE"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetallePage extends StatelessWidget {
  String nombre;
  DetallePage({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Soy la página detalle"),
            Text(
              "El nombre es $nombre",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Volver"),
            ),
          ],
        ),
      ),
    );
  }
}
