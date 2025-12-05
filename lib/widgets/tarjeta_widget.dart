import 'package:flutter/material.dart';
import 'package:recetasapp/models/receta_model.dart';

class RecetaCardWidget extends StatelessWidget {
  RecetaModel receta;
  RecetaCardWidget({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(receta.urlImage, width: 80),
        title: Text(receta.title),
        subtitle: Text(receta.type), 
      ),
    );
  }
}