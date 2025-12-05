import 'package:flutter/material.dart';
import 'package:recetasapp/models/receta_model.dart';

// ignore: must_be_immutable
class RecetaPage extends StatelessWidget {
  RecetaModel receta;
  RecetaPage({required this.receta});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(receta.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(32),
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.cyan,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(25),
                    child: Image.network(
                      receta.urlImage,
                      height: size.height / 4,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(receta.preparation),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}